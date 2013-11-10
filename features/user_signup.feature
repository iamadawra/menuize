Feature: Users should be able to create accounts.

As a prospective user
I want to sign up for the application
So that I can learn about restaurants and their menus, contribute to the information posted, and exclusively control what is displayed about my restaurant if i own it

Background:
Given the following users exist:
| email | password |
| johnsnow@gmail.com | john123 |
| sampeter@yahoo.com | sam123 |
And I am on the signup page

Scenario: Original email address is used.
Given I fill in "user[email]" with "george@gmail.com"
And I fill in "user[password]" with "george123"
And I fill in "user[password_confirmation]" with "george123"
And I press "Signup"
Then I should see "Signup was successful!"

Scenario: Email has already been used.
And I fill in "user[email]" with "johnsnow@gmail.com"
And I fill in "user[password]" with "whocares"
And I fill in "user[password_confirmation]" with "whocares"
And I press "Signup"
Then I should see "Email has already been taken"

Scenario: Password and password confirmation do not match.
Given I fill in "user[email]" with "saveen@gmail.com"
And I fill in "user[password]" with "saveen123"
And I fill in "user[password_confirmation]" with "xyz"
And I press "Signup"
Then I should see "Password doesn't match confirmation"