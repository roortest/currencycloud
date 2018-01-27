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

class Currencycloud

  def initialize
    Subclasses.pages.each do |page|
      self.class.send(:define_method, page.to_s.underscore) do
        page.new
      end
    end
  end

end