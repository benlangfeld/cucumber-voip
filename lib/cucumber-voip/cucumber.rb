%w{
  core_ext/punchblock/component/component_node
  rayo_driver
  api
  hooks
  step_definitions
}.each { |f| require "cucumber-voip/#{f}" }

World CucumberVoIP::API
