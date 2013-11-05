Feature: view pages

  Scenario: Unsuccessful signup
    Given a user visits the "signup" page
      And account he want to "register already taken"
    When he fill in form with "invalid" input
      And click "Sign up"
    Then he should see "this name was already taken"

  Scenario: Successful signup
    Given a user visits the "signup" page
    When he fill in form with "valid" input
      And click "Sign up"
    Then he should see index page with newly created session record

	Scenario: Unsuccessful login
    Given a user visits the "login" page
      And account he want to "enter exists"
    When he fill in form with "invalid" input
      And click "Log in"
    Then he should see "wrong password/login"

	Scenario: Successful login
    Given a user visits the "login" page
      And account he want to "enter exists"
    When he fill in form with "valid" input
      And click "Log in"
    Then he should see index page with newly created session record
