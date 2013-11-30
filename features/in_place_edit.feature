Feature: Allow owners and collaborative restaurant editors to edit restaurants from the show page itself instead of redirecting to a separate edit page.

As an editor
I want to edit restaurants without visiting a separate edit page
So that I do not have to visit multiple pages for a single task

Background:
  Given the following restaurants exist:
  | name | zip   | address | menu  | owned_by | status |
  | Pasta Benne | 94704 | 1 abc St, Berkeley  | pizza,pasta | 1 | Exclusive |
  | Thai Basil | 94704 | 2 abc St, Berkeley  |  thai combo,fried rice | 2 | Exclusive |
  | Racha | 94704 | 3 abc St, Berkeley | soup | 1 | Pending Approval |
  | Taco Bell | 9470 | 4 abc St, Berkeley | burrito | | Collaborative |

  And the following users exist:
  | email | password | id |
  | johnsnow@gmail.com | john123 | 1 |
  | sampeter@yahoo.com | sam123  | 2 |
  | george@gmail.com | george123 | 3 |

Scenario: Owner can edit the restaurant page he/she owns in place.
Given the current user is "johnsnow@gmail.com" with password "john123"
And I am on the show page for "Pasta Benne"
And I press "Edit"
Then I should be on the show page for "Pasta Benne"
And I should see edit columns for "Pasta Benne"

Scenario: Non-owners can edit collaborative restaurant pages in place.
Given the current user is "johnsnow@gmail.com" with password "john123"
And I am on the show page for "Taco Bell"
And I press "Edit"
Then I should be on the show page for "Taco Bell"
And I should see edit columns for "Taco Bell"
