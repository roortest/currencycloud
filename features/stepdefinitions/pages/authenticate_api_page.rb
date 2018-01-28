class AuthenticateApiPage < SitePrism::Page

element :authen_api_nav, '#accordion > h4'
element :api_uer_login_link, 'li.accordion-link.link'
element :end_api_session_link, '//*[@id="accordion"]/nav[1]/ul/li[2]/a'
element :login_id_value, '//*[@id="require-params"]/table/tbody/tr[2]/td[3]/span[2]'
element :api_key_value, '//*[@id="require-params"]/table/tbody/tr[3]/td[3]/span[2]'
element :execute, '#execute'
element :conversions_api, '//*[@id="accordion"]/h4[6]'
element :create_conversion_link, '//*[@id="accordion"]/nav[6]/ul/li[3]/a'
element :login_btn, '#form-submit'
element :login_id, '#form-email'
element :api_key, '#form-api-key'



def login_as_a(user2)
  login_id.set($users[user2]['email'])
  api_key.set($users[user2]['api_key'])
  login_btn.click
  end


  def generate_auth_token
   page.find('login_id_value').set('rchittathuru@gmail.com')
   page.find('login_id_value').send_keys(:enter)
   page.find('api_key_value').set('63d3f07936578492ecdc09fe072f5198d802f03cc7d0b3d115c88beca5c2a311')
   page.find('api_key_value').send_keys(:enter)
   page.find('execute').click
    page.find("#execution-status").value equal?('Completed')
  end


def retrieve_a_login_token
  require 'httparty'
  require 'json'
  response = HTTParty.get("https://devapi.currencycloud.com/v2/authenticate/api", :query =>{:auth_token => "abc"})
  json = JSON.parse(response.body)
  assert_equal '{"auth_token": 89fa1ea54adc7c2889f53225b895e4cd}', json
expect(page).to have_css('code.language-json >span.p', visible: true)
end


def end_api_session
  page.find('end_api_session_link').click
  page.find('execute').click
  page.find("#execution-status").value equal?('Completed')
end


  def end_api_session_response
    require 'httparty'
    require 'json'
    response = HTTParty.get("https://devapi.currencycloud.com/v2/authenticate/close_session", :query =>{})
    json = JSON.parse(response.body)
    expect(page).to have_css('code.language-json >span.p', visible: true)
  end

  def navigate_to_conversions_api
    page.find('conversions_api').click
    expect(page).to have_css('create_conversion_link', visible: true)
  end

end

