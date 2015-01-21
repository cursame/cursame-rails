formatter = Proc.new do |severity, time, progname, msg|
  "[#{time.strftime("%Y-%m-%d %H:%M:%S")}] #{msg.to_s.strip}\n"
end
MultiLogger.add_logger('gospel', formatter:formatter)