Feature: Users should be able to create accounts.

As a prospective user
I want to sign up for the application
So that I can learn about restaurants and their menus, contribute to the information posted, and exclusively control what is displayed about my restaurant if i own it

Background:
Given that the following users exist:
| first_name | last_name | username | email | password |
| John | Snow | jsnow| johnsnow@gmail.com | john123 |
| Sam | Peterson | speterson | sampeter@yahoo.com | sam123 |
And I am on the signup page

Scenario: Original username and email address is used.
Given I fill in "first_name" with "George"
And I fill in "last_name" with "Clooney"
And I fill in "username" with "gclooney"
And I fill in "password" with "george123"
And I fill in "confirm_password" with "george123"
And I fill in "email" with "george@gmail.com"
And I press "Create Account"
Then I should see "Account successfully created."

Scenario: Username has already been taken.
Given I fill in "first_name" with "Johnny"
And I fill in "last_name" with "Snow"
And I fill in "username" with "jsnow"
And I fill in "password" with "whocares"
And I fill in "confirm_password" with "whocares"
And I fill in "email" with "johnny@gmail.com"
And I press "Create Account"
Then I should see "Username already taken."

Scenario: Email has already been used.
Given I fill in "first_name" with "Johnny"
And I fill in "last_name" with "Snow"
And I fill in "username" with "johnnysnow"
And I fill in "password" with "whocares"
And I fill in "confirm_password" with "whocares"
And I fill in "email" with "jsnow@gmail.com"
And I press "Create Account"
Then I should see "An account already exists with this email address."