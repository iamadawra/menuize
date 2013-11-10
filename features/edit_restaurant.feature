Feature: Allow business owners to edit their restaurant page.

As a Business Owner
I want to edit my own restaurant page exclusively
So that correct information is available on the website for my restaurant.

Background: My restaurant has already been added.

  Given the following restaurants exist:
  | name | zip   | address | menu  | owned_by |
  | Pasta Benne | 94704 | 1 abc St, Berkeley  | pizza,pasta | 1 |
  | Thai Basil | 94704 | 2 abc St, Berkeley  |  thai combo,fried rice | 2 |

  Given the following users exist:
  | email | password | id |
  | johnsnow@gmail.com | john123 | 1 |
  | sampeter@yahoo.com | sam123  | 2 |
  
Scenario: Edit a restaurant "Pasta Benne" as a non-owner
Given I am on the edit page for "Pasta Benne"
When I select "10 pm" from "restaurant[close_time]"
And I select "Collaborative" from "restaurant[status]"
And I press "Update Restaurant"
Then I should reach the show page for "Pasta Benne"

Scenario: Edit a restaurant "Thai Basil" as an owner
Given I am on the edit page for "Thai Basil"
When I select "9 pm" from "restaurant[close_time]"
And I select "Exclusive" from "restaurant[status]"
And I press "Update Restaurant"
Then I should reach the show page for "Thai Basil"

Scenario: Owned restaurant cannot be edited by non-owners
  Given the current user is John Snow with password "john123"
  When I go to the show page for "Thai Basil"
  Then I should not see "Edit"

Scenario: Owned restaurant can be edited by owner
  Given the current user is John Snow with password "john123"
  When I go to the show page for "Pasta Benne"
  Then I should see "Edit"

