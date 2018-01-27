require 'rubygems'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'site_prism'
require 'rspec'
require 'rspec/expectations'
require 'rspec/matchers'
require 'capybara/rspec'
require 'cucumber'
require 'report_builder'

# $users = load_yaml_file('../config/users')

# choose a driver, if its not given, then default is firefox
if ENV['DRIVER'] == 'chrome'
  Capybara.default_driver = :chrome
elsif ENV['DRIVER'] == 'firefox'
  Capybara.default_driver = :firefox
else
  Capybara.default_driver = :debug
end


Capybara.configure do |config|
  config.app_host = "https://direct-demo.currencycloud.com/login"
  config.default_max_wait_time = 30
end


World(Capybara)
Capybara.register_driver :selenium_with_long_timeout do |app|
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 120
  Capybara::Selenium::Driver.new(app, :browser => :firefox, :http_client => client)
end

Capybara.register_driver :debug do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  profile.add_extension "features/support/firebug.xpi"
  profile.add_extension "features/support/firepath.xpi"
  Capybara::Selenium::Driver.new app, :profile => profile
end

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome, :switches => %w[--disable-popup-blocking  --disable-extensions])
end


World(TestWorld)
SitePrism.configure do |config|
  config.use_implicit_waits = true
end

# below module waits for 0.05 sec for every selenium command
module ::Selenium::WebDriver::Remote
  class Bridge
    def execute(*args)
      result = raw_execute(*args)['value']
      sleep 0.05
      result
    end
  end
end



