Feature: Allow users (website browsers a.k.a. readers) to search for restaurants by Name, Rating, Location.

As a Reader
I want Search functionality
So that I can find a particular restaurant.

Background: There are several restaurants in the database.

  Given the following restaurants exist:
  | name | zip   | address | menu  | owned_by | status |
  | Pasta Benne | 94704 | 1 abc St, Berkeley  | pizza,pasta | 1 | Exclusive |
  | Thai Basil | 94701 | 2 abc St, Berkeley  |  thai combo,fried rice | 2 | Exclusive |
  | Racha | 94704 | 3 abc St, Berkeley | soup | 1 | Pending Approval |
  | Taco Bell | 94704 |  abc St, Berkeley | burrito | | Collaborative |

Given I am on the restaurant page

Scenario: Search restaurants by location (ZIP)
When I fill in the following:
     | search       |       |
     | searchZip    | 94704 |
     
And I press "Search"
Then I should not see "Thai Basil"
And I should see "Racha"
And I should see "Taco Bell"
And I should see "Pasta Benne"

Scenario: Search Restaurants by Name
When I fill in the following:
     | search        | Taco  |
     | searchZip     |       |

Then I press "Search"
Then I should not see "Thai Basil"
And I should not see "Racha"
And I should see "Taco Bell"
And I should not see "Pasta Benne"

Scenario: No relevant results found (a.k.a. Sad Path)
When I fill in the following:
     | search      |   T    |
     | searchZip   | 94704  |

And I press "Search"
Then I should not see "Thai Basil"
And I should not see "Racha"
And I should see "Taco Bell"
And I should see "Pasta Benne"