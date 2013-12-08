Feature: allow users (business owners and non-owners) to add restaunts

As a Contributor
I want to add a restaurant page
So that I can share information about restaurants that I like or do not like and allow the restaurant to receive more publicity.

Background: I am on the "Add a Restaurant Page".

Given the following users exist:
| email | password | id |
| johnsnow@gmail.com | john123 | 1 |

And the current user is "johnsnow@gmail.com" with password "john123"
And I am on the add restaurant page

Scenario: Add a restaurant "Pasta Benne" as a non-owner
When I fill in the following:
     | restaurant[name]           | Pasta Benne		     |
     | restaurant[zip]	          | 94704		     |
     | restaurant[address]	  | 123 abc street, Berkeley |
     | restaurant[menu_items_attributes][0][content] | Godfather's favorite |
     | restaurant[menu_items_attributes][1][content] | Chicken Picatta |
And I press "Create Restaurant"
Then I should reach the show page for "Pasta Benne"
And I should see "Entry was successfully created."
And the restaurant "Pasta Benne" should be editable
And I should see "Godfather's favorite"
And I should see "Chicken Picatta"

Scenario: Add a restaurant "Thai Basil" as an owner
When I fill in the following:
     | restaurant[name]	          | Thai Basil		     |
     | restaurant[zip]	          | 94704		     |
     | restaurant[address]	  | 567 Durant, Berkeley     |
And I select "Exclusive" from "restaurant[status]"
And I press "Create Restaurant"
Then I should reach the show page for "Thai Basil"
And I should see "Entry was successfully created."
And the restaurant "Thai Basil" should be awaiting approval

Scenario: When I am not logged in, I should not be able to add a restaurant.
Given I browse restaurants without logging in
Then I should not see "New"