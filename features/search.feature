Feature: Allow users (website browsers a.k.a. readers) to search for restaurants by Name, Rating, Location.

As a Reader
I want Search functionality
So that I can find a particular restaurant.

Background: There are several restaurants in the database.

  Given the following restaurants exist:
  | name | zip   | address | menu  | owned_by | status |
  | Pasta Benne | 94704 | 1 abc St, Berkeley  | pizza,pasta | 1 | Exclusive |
  | Thai Basil | 94704 | 2 abc St, Berkeley  |  thai combo,fried rice | 2 | Exclusive |
  | Racha | 94704 | 3 abc St, Berkeley | soup | 1 | Pending Approval |
  | Taco Bell | 9470 | 4 abc St, Berkeley | burrito | | Collaborative |

And I am on the search page

Scenario: Search restaurants by location (ZIP)
When I fill in the following:
     | restaurant[name]       |       |
     | restaurant[zip]	      | 94704 |
     | restaurant[rating]	  |       |
     
And I press "Search"
Then I should reach the results page
And I should see "Three restaurants found"
And I should see "Thai Basil"
And I should see "Racha"
And I should see "Taco Bell"

Scenario: Search Restaurants by Name
When I fill in the following:
     | restaurant[name]       | Taco  |
     | restaurant[zip]	      |       |
     | restaurant[rating]	  |       |
And I press "Search"
Then I should reach the results page
And I should see "One restaurant found"
And I should see "Taco Bell"

Scenario: No relevant results found (a.k.a. Sad Path)
When I fill in the following:
     | restaurant[name]       | La Burrita  |
     | restaurant[zip]	      |             |
     | restaurant[rating]	  |             |
And I press "Search"
Then I should reach the results page
And I should see "No restaurant found"
And I should not see "Taco Bell"
And I should not see "Racha"