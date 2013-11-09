Feature: Users with registered accounts should be able to log in.

As a user
I want to log in to the app
So that I can keep track of the information I have posted, contribute more information, and access pages that require login

Background: The user exists in the database

Given that the following users exist:
| email | password |
| johnsnow@gmail.com | john123 |
| sampeter@yahoo.com | sam123 |
And I am on the login page

Scenario: User logs in with correct password and account exists.
Given I fill in "email" with "johnsnow@gmail.com"
And I fill in "password" with "john123"
And I press "Log in"
Then I should see "Logged in!"

Scenario: User tries to log in with incorrect password.
Given I fill in "email" with "johnsnow@gmail.com"
And I fill in "password" with "test"
And I press "Log in"
Then I should see "Invalid email or password"

Scenario: User tries to log in with incorrect email.
Given I fill in "email" with "jsnow@gmail.com"
And I fill in "password" with "john123"
And I press "Log in"
Then I should see "Invalid email or password"