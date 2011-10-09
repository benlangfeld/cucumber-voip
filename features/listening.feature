Feature: Listening
  As an awesome Ruby telephony developer
  In order to understand what my app is saying
  I want to be able to use an ASR engine to listen to my app

  @wip
  Scenario: Hearing hello
    Given an app which does:
      """
      accept
      answer
      sleep 1
      say :text => 'hello'
      hangup
      """
    And my standard caller ID
    When I dial my app
    Then the call should ring
    And the call should be answered
    And I should hear 'hello'
    And the call should be hung up
