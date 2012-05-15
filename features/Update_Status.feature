Feature: Update Facebook Status
  In Order To: obtain a new position in a QA leadership role
  As A QA professional
  I Want: to create a simple scripting example to demonstrate I know what I'm doing

  Scenario: I can post a facebook status update
    Given I am logged into facebook
    When I update my status
    Then a status update should be posted