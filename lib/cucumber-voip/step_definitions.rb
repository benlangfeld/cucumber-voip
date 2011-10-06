Given /^a caller ID of '([\w\d\s\.\:\@]+)'$/ do |caller_id|
  @outbound_caller_id = caller_id
end

When /^I dial '([\w\d\s\.\:\@]+)'$/ do |target_address|
  @call = dial :from => @outbound_caller_id, :to => target_address
end

Then /^the call should ring$/ do
  @call.ring_event.should be_a_valid_ringing_event
end

Then /^the call should be answered$/ do
  @call.next_event.should be_a_valid_answered_event
end

Then /^the call should be hung up$/ do
  @call.next_event.should be_a_valid_hangup_event
end
