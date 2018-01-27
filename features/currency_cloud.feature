Feature:A new Payments API has been delivered.
  This API allows users to create new payment records, amend details after submission, search for existing payments, and delete payment records as required.
  The API returns JSON responses and performs error handling in the event of an invalid request taking place.

  Background:
    Given I navigate to Currency Cloud URL "https://direct-demo.currencycloud.com/login"

    Scenario Outline: Perform User Login and retrieve a login token
      When I enter "<Login ID>","<Password>" to login into currency cloud
      And I perform retrieve login token
      Then I should see the login token
      Examples:
      |Login ID              |Password|
      |rchittathuru@gmail.com|Roopa@65|




    Scenario: Create a quote for Selling GBP and buying USD using the sell side
      When I choose Convert
      And I select Sell currency as GBP
      And I select Buy currency as USD
      And I enter amount to sell as <1000.00>
      And I complete the quote




    Scenario: Verify the buy amount is correct to the rate

      How can i verify the buy amount?




   Scenario: Create another quote but perform a negative assertion
       When I click on Convert
     And I select Sell currency as GBP
     And I select Buy currency as USD
     And I enter amount to sell as <1000.00>
     And I click on Select a Date
     And I click on Get a Quote
     Then I should see a message saying "Conversion Rate Could Not Be Retrieved"




  Scenario: End the API Session
     And I click on logout button