Feature: Allow business owners to edit their restaurant page.

As a Business Owner
I want to edit my own restaurant page exclusively
So that correct information is available on the website for my restaurant.

Background: My restaurant has already been added.

  Given the following restaurants exist:
  | name | status | zip   | address | open_time | close_time | menu  |
  | Pasta Benne | Exclusive  | 94704 | 1 abc St, Berkeley  |   10 am    |  8 pm   | pizza,pasta |
  | Thai Basil  | Exclusive  | 94704 | 2 abc St, Berkeley  | 12 pm | 10 pm  |  thai combo,fried rice |
  
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