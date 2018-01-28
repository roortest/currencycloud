
Given (/^I navigate to URL (.*)$/)do|url|
 url = "https://direct-demo.currencycloud.com/profile"
  visit url
  expected = page.current_url
  puts expected
end

When (/^I enter (.*),(.*) to login into currency cloud$/)do|login_id,password|

end

And (/^I perform API Key Generate$/)do

end

Then (/^I should see the API key$/)do

end

And (/^I enter login Id as (.*)$/)do|login_id|

end
And (/^I enter api key as (.*)$/)do|api_key|

end

And (/^I logout$/)do
  @currencycloud.DirectDemoProfilePage.logout.click
end


And (/^click on login$/)do

end

Then(/^I navigate to API user login page$/)do

end

And (/^I Generate authentication token$/)do
  @currencycloud.AuthenticateApiPage.generate_auth_token
end

And (/^I retrieve a login token$/)do
  @currencycloud.AuthenticateApiPage.retrieve_a_login_token
end

And (/^I click on End API session$/)do
  @currencycloud.AuthenticateApiPage.end_api_session
end


Then (/^I should get end api session response$/)do
  @currencycloud.AuthenticateApiPage.end_api_session_response
end

When (/^I navigate to Conversions API page$/)do
  @currencycloud.AuthenticateApiPage.navigate_to_conversions_api
end


And (/^I enter required parameters$/)do
@currencycloud.CreateConversionsPage.enter_required_parameter
end

And (/^I complete the quote$/)do
  @currencycloud.CreateConversionsPage.complete_quote
end

Then (/^I should get created quote response$/)do
  @currencycloud.CreateConversionsPage.created_quote_response
end

And (/^I enter required parameters with invalid data$/)do
  @currencycloud.CreateConversionsPage.required_parameters_invalid_data
end

Then (/^I should see a message saying (.*)$/)do|message|
  expect(page).to have_css('#execution-status', text: 'Error', visible: true)
  expect(page).to have_css('code.language-json', text: message,vsible: true)
end