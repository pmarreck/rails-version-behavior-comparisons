ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'stringio'
require 'shoulda'
require 'support/reporters'

load "#{Rails.root}/db/schema.rb"

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...

  def capturing_stdout
    out = StringIO.new
    $stdout = out
    $stdout.sync = true
    yield
    return out
  ensure
    $stdout = STDOUT
  end

  def capturing_stderr
    err = StringIO.new
    $stderr = err
    $stderr.sync = true
    yield
    return err
  ensure
    $stderr = STDERR
  end

  def capturing_stdout_and_stderr
    out, err = StringIO.new, StringIO.new
    $stdout, $stderr = out, err
    $stdout.sync = true
    $stderr.sync = true
    yield
    return out, err
  ensure
    $stdout, $stderr = STDOUT, STDERR
  end

end
