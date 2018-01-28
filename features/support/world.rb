require_relative '../stepdefinitions/classes/currencycloud.rb'
module TestWorld
  def currencycloud
    @currencycloud=CurrencyCloud.new
  end
end