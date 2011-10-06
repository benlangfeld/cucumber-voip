Given /^an app which does:$/ do |script|
  RayoDriver.target_instance.script = script
end