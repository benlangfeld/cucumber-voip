Feature: Speaking
  As an awesome Ruby telephony developer
  In order to imitate a human being during testing
  I want to be able to use a TTS engine to speak to my app

  @wip
  Scenario: Saying hello
    Given an app which does:
      """
      accept
      answer
      sleep 0.2
      hangup
      """
    And my standard caller ID
    When I dial my app
    Then the call should ring
    And the call should be answered
    When I say 'hello world'
    Then the call should be hung up

  @wip
  Scenario: Playing DTMF
    Given an app which does:
      """
      accept
      answer
      sleep 0.2
      hangup
      """
    And my standard caller ID
    When I dial my app
    Then the call should ring
    And the call should be answered
    When I press '5'
    Then the call should be hung up
