Feature: Allow business owners to edit their restaurant page.

As a Business Owner
I want to edit my own restaurant page exclusively
So that correct information is available on the website for my restaurant.

Background: My restaurant has already been added.

  Given the following restaurants exist:
  | name | zip   | address | menu  | owned_by | status | description |
  | Pasta Benne | 94704 | 1 abc St, Berkeley  | pizza,pasta | 1 | Exclusive | Tasty |
  | Thai Basil | 94704 | 2 abc St, Berkeley  |  thai combo,fried rice | 2 | Exclusive | Tasty |
  | Racha | 94704 | 3 abc St, Berkeley | soup | 1 | Pending Approval | Tasty |
  | Taco Bell | 9470 | 4 abc St, Berkeley | burrito | | Collaborative | Tasty |

  And the following users exist:
  | email | password | id |
  | johnsnow@gmail.com | john123 | 1 |
  | sampeter@yahoo.com | sam123  | 2 |
  | george@gmail.com | george123 | 3 |
  
Scenario: Cannot edit an owned restaurant "Thai Basil" if not the owner
Given the current user is "johnsnow@gmail.com" with password "john123"
Then I should not see "Edit" in the row for "Thai Basil"

Scenario: Can edit a restaurant "Thai Basil" as the owner
Given the current user is "sampeter@yahoo.com" with password "sam123"
Then I should see "Edit" in the row for "Thai Basil"

Scenario: Pending restaurant cannot be edited by non-requester
Given the current user is "sampeter@yahoo.com" with password "sam123"
Then I should not see "Edit" in the row for "Racha"

Scenario: Pending restaurant can not be edited by requester
Given the current user is "johnsnow@gmail.com" with password "john123"
Then I should see "Edit" in the row for "Racha"
And I should not see "Delete" in the row for "Racha"

Scenario: Collaborative restaurant can be edited but not deleted by all
Given the current user is "george@gmail.com" with password "george123"
Then I should see "Edit" in the row for "Taco Bell"
And I should not see "Delete" in the row for "Taco Bell"

Scenario: User claims ownership through edit for collaborative page
Given the current user is "george@gmail.com" with password "george123"
And I am on the edit page for "Taco Bell"
And I select "Exclusive" from "restaurant[status]"
And I press "Update Restaurant"
Then the restaurant "Taco Bell" should be awaiting approval

Scenario: Owner deletes restaurant they own
Given the current user is "sampeter@yahoo.com" with password "sam123"
And I am on the show page for "Thai Basil"
And I delete "Thai Basil"
Then I should be on the restaurants page
And I should not see "Thai Basil"