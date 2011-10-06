# TODO: Figure out how to do this before the suite, rather than before each scenario
Before do
  begin
    start_rayo_driver
  rescue => e
    puts e.message
    puts e.backtrace.join("\n")
  end
end

After do
  cleanup_calls
end
