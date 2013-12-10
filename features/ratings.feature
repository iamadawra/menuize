Feature: Allow users to like or dislike restaurants 

As a User
I want a Rating System
So that I can like or dislike a particular restaurant

Background: There are several restaurants in the database.

  Given the following restaurants exist:
  | name | zip   | address | menu  | owned_by | status |
  | Pasta Benne | 94704 | 1 abc St, Berkeley  | pizza,pasta | 1 | Exclusive |
  | Thai Basil | 94701 | 2 abc St, Berkeley  |  thai combo,fried rice | 2 | Exclusive |
  | Taco Bell | 94704 |  abc St, Berkeley | burrito | | Collaborative |

  And the following users exist:
  | email | password | id |
  | johnsnow@gmail.com | john123 | 1 |
  | sampeter@yahoo.com | sam123  | 2 |
  | george@gmail.com | george123 | 3 |  

  Given the current user is "johnsnow@gmail.com" with password "john123"
  Given I am on the show page for "Pasta Benne"

Scenario: Upvote "Pasta Benne
When I follow "Like"
When I reach the restaurant page
Then "Pasta Benne" should appear before "Thai Basil"

Scenario: Downvote Pasta Benne
When I follow "Dislike"
When I reach the restaurant page
Then "Taco Bell" should appear before "Pasta Benne"