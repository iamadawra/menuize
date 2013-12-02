Feature: Allow admins to approve and deny ownership requests

As an admin
I want buttons to grant or deny exclusive ownership of restaurants
So that I can approve or deny ownership requests

Background:
  Given the following restaurants exist:
  | name | zip   | address | menu  | owned_by | status |
  | Thai Basil | 94704 | 2 abc St, Berkeley  |  thai combo,fried rice | 2 | Exclusive |
  | Racha | 94704 | 3 abc St, Berkeley | soup | 1 | Pending Approval |
  | Taco Bell | 9470 | 4 abc St, Berkeley | burrito | | Collaborative |
  
  And I am on the admin page
  
Scenario: Approve a user's ownership request
When a user requests ownership of "Taco Bell"
And the request is legitimate
And I press "Approve Request"
Then I should see "Request was successfully approved"
  
Scenario: Reject a user's ownership request
When a user requests ownership of "Taco Bell"
And the request is not legitimate
And I press "Deny Request"
Then I should see "Request was successfully denied"