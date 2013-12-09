Feature: Checking the remember me box during login keeps the user logged in even if they close the window

As a user
I want to be remembered when I log in
So that I do not need to log in again if I leave the site and come back

Background:
  Given the following users exist:
  | email | password | id |
  | johnsnow@gmail.com | john123 | 1 |
  | sampeter@yahoo.com | sam123  | 2 |
  | george@gmail.com | george123 | 3 |

@javascript
Scenario: Remember me box is checked
Given the user is "johnsnow@gmail.com" remembered with password "john123"
When I reopen the browser
And I visit the login page
And I wait for 500 milliseconds
Then I should see "johnsnow@gmail.com"

@javascript
Scenario: Remember me box is not checked
Given the current user is "johnsnow@gmail.com" with password "john123"
When I reopen the browser
And I visit the login page
Then I should not see "johnsnow@gmail.com"
