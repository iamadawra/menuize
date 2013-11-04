Feature: Allow all users to edit restaurant info (non-claimed pages only)
    
As a contributor
I want to edit information on a restaurant page
So that I can share my knowledge and get a sense of achievement
    
Background: The restaurant I am editing has already been added.


Given the following restaurants exists

| name    | zip   | address    | open_time | close_time | menu | 
| Top Dog | 94704 | 1 abc St, Berkeley | 10AM | 8PM | hot dogs       |
    
Scenario: Edit Top Dog's hours and menu

Given I am on the edit page for "Top Dog"
And I select "11 pm" from "restaurant[close_time]"
And I press "Update Restaurant"
Then I should reach the show page for "Top Dog"
And "Top Dog" should have Close Time equals "11 pm"