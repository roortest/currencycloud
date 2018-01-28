@wip
Feature:A new Payments API has been delivered.
  This API allows users to create new payment records, amend details after submission, search for existing payments, and delete payment records as required.
  The API returns JSON responses and performs error handling in the event of an invalid request taking place.

  Background:
    Given I navigate to URL "https://direct-demo.currencycloud.com/login"
    When I enter Login ID,Password to login into currency cloud        # NEED TO WORK OUT
    And I perform API Key Generate
    Then I should see the API key
    And I logout
    And I navigate to URL "https://developer.currencycloud.com/login/"
    And I enter login Id as <login_id>
    And I enter api key as <api_key>
    And click on login
  Examples:
  |login_id                  |api_key                                                         |
  |rchittathuru@gmail.com    |63d3f07936578492ecdc09fe072f5198d802f03cc7d0b3d115c88beca5c2a311|



  Scenario1: Perform User Login and retrieve a login token
    Then I navigate to API user login page
    And I Generate authentication token
    And I retrieve a login token


  Scenario2: Create a quote for Selling GBP and buying USD using the sell side
    When I navigate to Conversions API page
    And I enter all required parameters with valid data
    And I complete the quote
    Then I should get created quote response


  Scenario3: Verify the buy amount is correct to the rate

      How can i verify the buy amount?


  Scenario4: Create another quote but perform a negative assertion
    When I navigate to Convertions API page
    And I enter all required parameters with invalid data
    Then I should see a message saying "Conversion Rate Could Not Be Retrieved"



  Scenario5: End the API Session
    And I click on End API session
    Then I should get end api session response