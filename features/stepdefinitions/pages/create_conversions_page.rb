class CreateConversionsPage < SitePrism::Page

  element :conversions_api, '//*[@id="accordion"]/h4[6]'
  element :create_conversion_link, '//*[@id="accordion"]/nav[6]/ul/li[3]/a'
  element :buy_currency_value, '//*[@id="require-params"]/table/tbody/tr[2]/td[3]/input'
  element :sell_currency_value, '//*[@id="require-params"]/table/tbody/tr[3]/td[3]/input'
  element :fixed_side_value, '//*[@id="require-params"]/table/tbody/tr[4]/td[3]/input'
  element :amount_value, '//*[@id="require-params"]/table/tbody/tr[5]/td[3]/input'
  element :term_agreement_value, '//*[@id="require-params"]/table/tbody/tr[6]/td[3]/input'
  element :execute,


  def enter_required_parameter
  page.find('buy_currency_value').set('USD')
  page.find('buy_currency_value').send_keys(:enter)
  page.find('sell_currency_value').set('GBP')
  page.find('sell_currency_value').send_keys(:enter)
  page.find('fixed_side_value').set('sell')
  page.find('fixed_side_value').send_keys(:enter)
  page.find('amount_value').set('1000.23')
  page.find('amount_value').send_keys(:enter)
  page.find('term_agreement_value').set('true')
  page.find('term_agreement_value').send_keys(:enter)

  end

  def required_parameters_invalid_data
    page.find('buy_currency_value').set('GHD')
    page.find('buy_currency_value').send_keys(:enter)
    page.find('sell_currency_value').set('USD')
    page.find('sell_currency_value').send_keys(:enter)
    page.find('fixed_side_value').set('buy')
    page.find('fixed_side_value').send_keys(:enter)
    page.find('amount_value').set('100.23')
    page.find('amount_value').send_keys(:enter)
    page.find('term_agreement_value').set('true')
    page.find('term_agreement_value').send_keys(:enter)
  end

  def complete_quote
    page.find('execute').click
    page.find("#execution-status").value equal?('Completed')
  end

  def created_quote_response
    require 'httparty'
    require 'json'
    response = HTTParty.get("https://devapi.currencycloud.com/v2/conversions/create", :query =>{ })
    json = JSON.parse(response.body)
    assert_equal '{"error_code": "conversion_create_failed"}', json
  end


  end