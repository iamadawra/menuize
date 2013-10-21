Feature: Allow business owners to edit their restaurant page.

As a Business Owner
I want to edit my own restaurant page exclusively
So that correct information is available on the website for my restaurant.

Background: My restaurant has already been added.

  Given the following restaurants exist:
  | Name                   | ZIP   | Address             | Open Time | Close Time | Menu Items              | Owner |
  | Pasta Benne            | 94704 | 1 abc St, Berkeley  |   10AM    |  8PM       | pizza,pasta             | 92928 |
  | Thai Basil             | 94704 | 2 abc St, Berkeley  |   12PM    |  10PM      | thai combo,fried rice   | 51871 |

  Given I am on the edit restaurant page.
  
Scenario: Edit a restaurant "Pasta Benne" as a non-owner
When I fill in the following:
     | Name            | Pasta Benne		  |
     | ZIP	           | 94704		    	  |
     | Address	       | 123 abc street, Berkeley |
     | Open Time       | 7 am        	 	  |
     | Close Time      | 8 pm			      |
     | Menu Items      | pizza, pasta 		  |
And I select "Non-Owner" from "Owns?"
And I press "Save"
Then I should see "Restaurant Owner has exclusive access over the editing of this page."

Scenario: Edit a restaurant "Thai Basil" as an owner
When I fill in the following:
     | Name	           | Thai Basil		      |
     | ZIP	           | 94704			      |
     | Address	       | 567 Durant, Berkeley |
     | Open Time       | 7 am	     		  |
     | Close Time      | 10 pm			      |
     | Menu Items      | Thai combo, Fried rice |
And I select "Owner" from "Owns?"
And I press "Save"
Then I should see "Restaurant Added as Owner."