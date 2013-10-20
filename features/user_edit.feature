Feature: Allow all users to edit restaurant info (non-claimed pages only)
    
As a contributor
I want to edit information on a restaurant page
So that I can share my knowledge and get a sense of achievement
    
Background: I am on the "Manage Business Page".

Scenario: Edit "Panchos" as a non-owner

Given Business Name is Panchos and Menu Items are Burritos, Tacos

When I enter in the following restaurant information:

    | Description   | Mexican restaurant   |
    | Hours   | 10 AM - 12 AM |
    
And I press "Submit"
Then I should see "Restaurant Information Edited"
And the View Business Page should show "Description" as "Mexican restaurant"
And the View Business Page should show "Hours" as "10 AM - 12 AM"