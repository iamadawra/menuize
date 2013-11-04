Feature: Users with registered accounts should be able to log in.

As a user
I want to log in to the app
So that I can keep track of the information I have posted, contribute more information, and access pages that require login

Background: The user exists in the database

Given that the following users exist:
| name | email | password |
| John Snow | johnsnow@gmail.com | john123 |
| Sam Peterson | sampeter@yahoo.com | sam123 |
And I am on the login page

Scenario: User logs in with correct password and account exists.
Given I fill in "username" with "John Snow"
And I fill in "password" with "john123"
And I press "Submit"
Then I should be on the homepage

Scenario: User tries to log in with incorrect password.
Given I fill in "username" with "John Snow"
And I fill in "password" with "test"
And I press "Submit"
Then I should see "Incorrect username and/or password"

Scenario: User tries to log in with incorrect username.
Given I fill in "username" with "John"
And I fill in "password" with "john123"
And I press "Submit"
Then I should see "Incorrect username and/or password"