@wip
Feature:A new Payments API has been delivered.
  This API allows users to create new payment records, amend details after submission, search for existing payments, and delete payment records as required.
  The API returns JSON responses and performs error handling in the event of an invalid request taking place.

  Background:
    Given that I have direct demo currency cloud login page opened
    When I login as an "User1"
    And I Generate API Key
    Then I should see the API key
    And I logout
    And I navigate to URL "https://developer.currencycloud.com/login/"
    And I login as a "User2"


  Scenario1: Perform User Login and retrieve a login token
    Then I navigate to API user login page
    And I Generate authentication token
    And I retrieve a login token


  Scenario2: Create a quote for Selling GBP and buying USD using the sell side
    When I navigate to Conversions API page
    And I enter required parameters
    And I complete the quote
    Then I should get created quote response


  Scenario3: Verify the buy amount is correct to the rate
    #UNABLE TO TEST THIS SCENARIO AS I CAN SEE ERROR MESSAGE ALL THE TIME SO COULDN'T ABLE TO COMPARE
     #HAVE ATTACHED SCREENSHOT FOR THIS ISSUE.


  Scenario4: Create another quote but perform a negative assertion
    When I navigate to Conversions API page
    And I enter required parameters with invalid data
    Then I should see a message saying "Internal server error"


  Scenario5: End the API Session
    And I click on End API session
    Then I should get end api session response