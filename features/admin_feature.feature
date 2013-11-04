Feature: Admins

As a Menuize Admin
I want to send out an email to users requesting ownership of a restaurant
So that I can inform them that their request was granted and allow them to exclusively manage their restaurant


Given that I have received an ownership request:
And I am on the Send Request Confirmation page


Scenario: Legitimate business owner selects the claim ownership option on a page.
Given "Owner name" wants to claim "Restaurant name"
And I determine that the owner's claim is legitimate
And I fill out the restaurant/owner categories
Then an email should be sent to the owner confirming ownership

Scenario: Person selects the claim ownership option on a page but doesn't pass due dilligence.
Given "Owner name" wants to claim "Restaurant name"
And I determine that the person's claim is not legitimate
Then I should not send an email

Scenario: Legitimate business owner creates a restaurant and wants sole ownership.
Given "Owner name" creates "Restaurant name"
And I determine that the owner is legitimate
And I fill out the restaurant/owner categories
Then an email should be sent to the owner confirming ownership