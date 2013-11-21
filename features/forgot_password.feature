Feature: Allow users to retrieve their password in case they forget their login password

As a user
I want to receive an email with instructions on how to reset my password
So that I may reset my password in case I forget my old password

  And the following users exist:
  | email | password | id |
  | bazinga@gmail.com | bazinga123 | 1 |
  | hello@gmail.com | hello123  | 2 |
  | boss@gmail.com | boss123 | 3 |
  And I am on the login page

Scenario: User tries to log in with correct email
Given I fill in "email" with "bazinga@gmail.com"
And I press "Forgot my Password!"
Then I should see "Password Reset Instructions have been sent to bazinga@gmail.com"

Scenario: User tries to log in with incorrect email
Given I fill in "email" with "hello@gmail.com"
And I press "Forgot my Password!"
Then I should see "We're sorry, there is no registered user with the given email"