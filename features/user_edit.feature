Feature: Allow all users to edit restaurant info (non-claimed pages only)
    
As a contributor
I want to edit information on a restaurant page
So that I can share my knowledge and get a sense of achievement
    
Background: The restaurant I am editing has already been added.


Given the following restaurants exists

| name    | zip   | address    | open_time | close_time | menu | 
| Top Dog | 94704 | 1 abc St, Berkeley | 10AM | 8PM | hot dogs       |
    

Given I am on the edit restaurant page

Scenario: Edit Top Dog's hours and menu

When I fill in the following

| name    | zip   | address    | open_time | close_time | menu | 
| Top Dog | 94704 | 1 abc St, Berkeley | 9AM | 11PM | hot dogs, soda |

And I press "Submit"
Then I should see "Restaurant Info Successfully Edited"
And "Top Dog" should have Close Time equals "11PM"