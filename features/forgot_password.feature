Feature: Allow users to retrieve their password in case they forget their login password

As a user
I want to receive an email with instructions on how to reset my password
So that I may reset my password in case I forget my old password

Scenario: User tries to log in with correct email
Given I sign up as "bazinga@gmail.com" with password "bazinga123"
And I am on the login page
And I follow "Forgot My Password!"
And I fill in "email" with "bazinga@gmail.com"
And I press "Reset Password"
Then I should see "Email sent with password reset instructions."

Scenario: User tries to log in with incorrect email
Given I am on the login page
And I follow "Forgot My Password!"
And I fill in "email" with "test@gmail.com"
And I press "Reset Password"
Then I should see "Sorry! User with the specified email does not exist."