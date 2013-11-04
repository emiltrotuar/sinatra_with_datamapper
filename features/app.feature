Feature: view pages

	Scenario: Index page
    Given a user visits index page
    Then he should see new session record
      And he should see "Datamapper in action" within title

  Scenario: Unsuccessful signup
    Given a user visits the signup page
      And name he want to register was alreasy taken
    When he tries to register account with this name
    Then he should see an error message

	Scenario: Successful signup
    Given a user visits the signup page
      And name he want to register not exists
    When he register account with this name
    Then he should see index page with newly created session record

	Scenario: Unsuccessful login
    Given a user visits the login page
      And he has an account
    When he submits invalid login information
    Then he should see an error message

	Scenario: Successful login
    Given a user visits the login page
      And he has an account
    When the user submits valid login information
    Then he should see index page with newly created session record
