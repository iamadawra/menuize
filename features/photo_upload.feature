Feature: Allow business owners to exclusively upload and delete photos for their restaurants, and everyone to upload photos for collaborative restaurants.

As a business owner
I want to be able to upload pictures for my restaurant exclusively
So that the images accurately depict what a customer at my restaurant will see.

As a non-business owner
I want to be able to upload pictures for collaborative restaurants
So that other users know what to expect at a restaurant before they visit it.

Background:
  Given the following restaurants exist:
  | name | zip   | address | menu  | owned_by | status |
  | Pasta Benne | 94704 | 1 abc St, Berkeley  | pizza,pasta | 1 | Exclusive |
  | Thai Basil | 94704 | 2 abc St, Berkeley  |  thai combo,fried rice | 2 | Exclusive |
  | Racha | 94704 | 3 abc St, Berkeley | soup | 1 | Pending Approval |
  | Taco Bell | 9470 | 4 abc St, Berkeley | burrito | | Collaborative |

  And the following users exist:
  | email | password | id |
  | johnsnow@gmail.com | john123 | 1 |
  | sampeter@yahoo.com | sam123  | 2 |
  | george@gmail.com | george123 | 3 |

Scenario: Owner can exclusively add and delete photos.
Given the current user is "johnsnow@gmail.com" with password "john123"
And I am on the edit page for "Pasta Benne"
Then I should see "Upload Photo"
And I attach "mushroom.png"
And I press "Update Restaurant"
Then I should reach the show page for "Pasta Benne"
And I should see "Entry was successfully updated."
And the page should have the "Mushroom" image

Scenario: Everyone can add photos for a collaborative restaurant.
Given the current user is "johnsnow@gmail.com" with password "john123"
And I am on the edit page for "Taco Bell"
Then I should see "Upload Photo"

Scenario: Everyone adding photos for collaborative restaurant works.
Given the current user is "johnsnow@gmail.com" with password "john123"
And I am on the edit page for "Taco Bell"
And I attach "mushroom.png"
And I press "Update Restaurant"
Then I should reach the show page for "Taco Bell"
And I should see "Entry was successfully updated."
And the page should have the "Mushroom" image