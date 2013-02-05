unless ENV['REPORTER'].blank?
  require 'minitest/reporters'
  MiniTest::Unit.runner = MiniTest::SuiteRunner.new

  reps_requested = ENV['REPORTER'].split(',')
  final_reps = []
  reps_requested.each do |rep|
    case rep
    when 'color'
      final_reps |= [MiniTest::Reporters::ColorDefaultReporter]
    when 'sound'
      final_reps |= [MiniTest::Reporters::SoundReporter]
    when 'spec'
      final_reps |= [MiniTest::Reporters::SpecReporter]
    when 'progress'
      final_reps |= [MiniTest::Reporters::ProgressReporter]
    when 'mate'
      final_reps |= [MiniTest::Reporters::RubyMateReporter]
    when 'slowtest', 'slowlist'
      final_reps |= [MiniTest::Reporters::SlowTestReporter]
    when 'failtest', 'faillist'
      final_reps |= [MiniTest::Reporters::FailTestReporter]
    when 'ci', 'jenkins'
      final_reps |= [MiniTest::Reporters::SpecNoColorReporter,
                     MiniTest::Reporters::JUnitReporter]
    when 'ci-slowtest', 'jenkins-slowtest'
      final_reps |= [MiniTest::Reporters::SpecNoColorReporter,
                     MiniTest::Reporters::JUnitReporter,
                     MiniTest::Reporters::SlowTestReporter,
                     MiniTest::Reporters::FailTestReporter]
    else
      puts "WARNING: Unrecognized REPORTER type: #{rep}"
    end
  end
  # check for existence of a basic reporter output type
  # and add default if none
  if ([MiniTest::Reporters::DefaultReporter,
       MiniTest::Reporters::ColorDefaultReporter,
       MiniTest::Reporters::SpecReporter,
       MiniTest::Reporters::ProgressReporter,
       MiniTest::Reporters::SpecNoColorReporter] & final_reps).empty?
    final_reps |= [MiniTest::Reporters::DefaultReporter]
  end
  final_reps.each{|r| MiniTest::Unit.runner.reporters << r.new }
end
