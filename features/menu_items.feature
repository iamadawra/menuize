Feature: Users can dynamically add and remove columns for menu items when creating and editing restaurants.

As a contributor
I want to be able to dynamically add and remove columns for menu items
So that all the menu items are not consolidated into one text box

Background:  
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

@javascript
Scenario: Create form can add and remove menu item fields
Given the current user is "johnsnow@gmail.com" with password "john123"
And I am on the add restaurant page
When I follow "Add Menu Item"
Then there should be "4" menu item boxes
When I hover over and click on remove link
Then there should be "3" menu item boxes

@javascript
Scenario: Edit form can add and remove menu item fields
Given the current user is "johnsnow@gmail.com" with password "john123"
And I am on the edit page for "Pasta Benne"
When I follow "Add Menu Item"
Then there should be "4" menu item boxes
When I hover over and click on remove link
Then there should be "3" menu item boxes