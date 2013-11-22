Feature: Merging articles
  As an admin
  In order to make sure others don't have access to merge
  I want to prevent non-admins from merging articles 

Background: articles have been added to the database
	
  Given the following articles exist: 
  |title          |body              |
  |"Hello"        |"Hello"           |
  |"World"        |"Duck"            |
  
Scenario: A non-admin cannot merge two articles
  Given the blog is set up
  When I visit the edit page for "Hello"
  Then I should not see "Merge Article"

Scenario: Merging Content
  Given the blog is set up
  And I am logged into the admin panel
  And I visit the edit page for "Hello"
  When I fill in "Article ID" with "2"
  And I press "Merge"
  And I am on the home page
  Then I should see "Duck"
  And I should not see "World"
  

