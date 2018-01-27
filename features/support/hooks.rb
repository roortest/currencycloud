require 'report_builder'
at_exit do
  ReportBuilder.configure do |config|
    config.json_path = 'reports'
    config.report_path = 'report'
    config.report_types = [:html]
    config.report_tabs = [:overview, :features, :scenarios, :errors]
    config.report_title = 'Test Results'
    config.compress_images = false
  end
  ReportBuilder.build_report
end


Before do
  page.driver.browser.manage.window.maximize
  #@tribal = Currencycloud.new
end


# After ('not @nologout') do
#   find('header__topbar-link logout-link').click
# end



After do |scenario|
  if (scenario.failed?)
    Dir.mkdir("images") unless File.directory?("images")
    image_name = "images/#{scenario.__id__}.png"
    save_screenshot(image_name)
    embed(image_name, "image/png", "SCREENSHOT")
  end
end
