Feature: Allow admins to approve and deny ownership requests

As an admin
I want buttons to grant or deny exclusive ownership of restaurants
So that I can approve or deny ownership requests

Background:
  Given the following restaurants exist:
  | id | name | zip   | address | menu  | owned_by | status |
  | 1| Pasta Benne | 94704 | 1 abc St, Berkeley  | pizza,pasta | 1 | Exclusive |
  | 2| Thai Basil | 94704 | 2 abc St, Berkeley  |  thai combo,fried rice | 2 | Exclusive |
  | 3| Racha | 94704 | 3 abc St, Berkeley | soup | 1 | Pending Approval |
  | 4| Taco Bell | 9470 | 4 abc St, Berkeley | burrito | | Collaborative |

  And the following users exist:
  | email | password | id |
  | johnsnow@gmail.com | john123 | 1 |
  | sampeter@yahoo.com | sam123  | 2 |
  | george@gmail.com | george123 | 3 |

  And "johnsnow@gmail.com" with password "john123" has requested ownership of "Taco Bell"
  And I am logged in as admin
  And I visit the admin page for pending approvals
  
Scenario: Admin page shows user ownership requests
Then I should see "Taco Bell"

Scenario: Approve an owner's request
Given I follow "Approve" for "Taco Bell"
Then I should not see "Taco Bell"
And "johnsnow@gmail.com" with password "john123" should be able to edit "Taco Bell"
And "sampeter@yahoo.com" with password "sam123" should not be able to edit "Taco Bell"
  
Scenario: Reject a user's ownership request
Given I follow "Deny" for "Taco Bell"
Then I should not see "Taco Bell"
And "johnsnow@gmail.com" with password "john123" should be able to edit "Taco Bell"
And "sampeter@yahoo.com" with password "sam123" should be able to edit "Taco Bell"