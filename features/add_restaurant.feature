Feature: allow users (business owners and non-owners) to add restaunts

As a Contributor
I want to add a restaurant page
So that I can share information about restaurants that I like or do not like and allow the restaurant to receive more publicity.

Background: I am on the "Add a Restaurant Page".

Given I am on the add restaurant page

Scenario: Add a restaurant "Pasta Benne" as a non-owner
When I fill in the following:
     | restaurant[name]           | Pasta Benne		     |
     | restaurant[zip]	          | 94704		     |
     | restaurant[address]	  | 123 abc street, Berkeley |
     | restaurant[menu]           | pizza, pasta 	     |
And I press "Create Restaurant"
Then I should reach the show page for "Pasta Benne"
And the restaurant "Pasta Benne" should be editable

Scenario: Add a restaurant "Thai Basil" as an owner
When I fill in the following:
     | restaurant[name]	          | Thai Basil		     |
     | restaurant[zip]	          | 94704		     |
     | restaurant[address]	  | 567 Durant, Berkeley     |
     | restaurant[menu]           | Thai combo, Fried rice   |
And I select "Exclusive" from "restaurant[status]"
And I press "Create Restaurant"
Then I should reach the show page for "Thai Basil"
And the restaurant "Thai Basil" should not be editable