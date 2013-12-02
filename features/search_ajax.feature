Feature: Allow users (website browsers a.k.a. readers) to search for restaurants by Name, Location with ajax functionality.

As a developer
I want search to use ajax functionality
So that the response time is better and a reload is not visible when searches are being conducted

Background: There are several restaurants in the database.

  Given the following restaurants exist:
  | name | zip   | address | menu  | owned_by | status | description |
  | Pasta Benne | 94704 | 1 abc St, Berkeley  | pizza,pasta | 1 | Exclusive | Tasty |
  | Thai Basil | 94701 | 2 abc St, Berkeley  |  thai combo,fried rice | 2 | Exclusive | Tasty |
  | Racha | 94704 | 3 abc St, Berkeley | soup | 1 | Pending Approval | Tasty |
  | Taco Bell | 94704 |  abc St, Berkeley | burrito | | Collaborative | Tasty |

Given I am on the restaurant page

Scenario: Search restaurants by location (ZIP)
When I fill in the following:
     | search       |       |
     | searchZip    | 94704 |
     
Given I wait for 500 milliseconds
Then I should not see "Thai Basil"
And I should see "Racha"
And I should see "Taco Bell"
And I should see "Pasta Benne"

Scenario: Search Restaurants by Name
When I fill in the following:
     | search        | Taco  |
     | searchZip     |       |

Given I wait for 500 milliseconds
Then I should not see "Thai Basil"
And I should not see "Racha"
And I should see "Taco Bell"
And I should not see "Pasta Benne"

Scenario: No relevant results found (a.k.a. Sad Path)
When I fill in the following:
     | search      |   T    |
     | searchZip   | 94704  |

Given I wait for 500 milliseconds
Then I should not see "Thai Basil"
And I should not see "Racha"
And I should see "Taco Bell"
And I should see "Pasta Benne"