Given (/^that I have direct demo currency cloud login page opened$/)do|url|
 @currencycloud.direct_demo_login_page.load
end

When (/^I login as an (.*)$/)do|user1|
  @currencycloud.DirectDemoLoginPage.login_as(user1)
end

And (/^I Generate API Key$/)do
@currencycloud.DirectDemoLoginPage.generate_api_key
end

Then (/^I should see the API key$/)do
  @currencycloud.DirectDemoLoginPage.verify_generate_api_key
end


And (/^I navigate to URL (.*)$/)do |url|
  visit url
end

And (/^I login as a(.*)$/)do|user2|
  @currencycloud.AuthenticateApiPage.login_as_a(user2)
end


And (/^I logout$/)do
  @currencycloud.DirectDemoLoginPage.logout.click
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