class AuthenticateLoginPage < SitePrism::Page
element :login_id_value, '//*[@id="require-params"]/table/tbody/tr[2]/td[3]/span[2]'
element :api_key_value, '//*[@id="require-params"]/table/tbody/tr[3]/td[3]/span[2]'
element :execute, '#execute'


  def generate_auth_token
   page.find('login_id_value').set('rchittathuru@gmail.com')
   page.find('login_id_value').send_keys(:enter)
   page.find('api_key_value').send_keys(:'63d3f07936578492ecdc09fe072f5198d802f03cc7d0b3d115c88beca5c2a311')
   page.find('execute').click
    page.find("#execution-status").value equal?('Completed')
  end


def retrieve_a_login_token
  require 'httparty'
  require 'json'
  response = HTTParty.get("https://devapi.currencycloud.com/v2/authenticate/api", :query =>{:oauth_token => "810ce31c121718c986e1f9fd3898f04b"})
  json = JSON.parse(response.body)
expect(page).to have_css('.language-json', visible: true)
end




end

