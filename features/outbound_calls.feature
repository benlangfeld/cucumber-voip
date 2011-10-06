Feature: Outbound calls
  As an awesome Ruby telephony developer
  In order to check the most basic operation of my application
  I want to be able to make outbound calls and perform assertions on their progress

  Scenario: Making a call which is accepted and then hung up
    Given a caller ID of 'sip:ben@langfeld.me'
    When I dial 'sip:usera@127.0.0.1'
    Then the call should ring
    And the call should be rejected

  Scenario: Making a call which is accepted, answered and then hung up
    Given a caller ID of 'sip:ben@langfeld.me'
    When I dial 'sip:usera@127.0.0.1'
    Then the call should ring
    And the call should be answered
    And the call should be hung up
