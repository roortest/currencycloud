










And (/^I enter login Id as (.*)$/)do|login_id|

end
And (/^I enter api key as (.*)$/)do|api_key|

end

And (/^click on login$/)do

end

Then(/^I navigate to API user login page$/)do

end

And (/^I Generate authentication token$/)do
  @currencycloud.AuthenticateLoginPage.generate_auth_token
end
And (/^I retrieve a login token$/)do
  @currencycloud.AuthenticateLoginPage.retrieve_a_login_token
end