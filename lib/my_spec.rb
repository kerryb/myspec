class MySpec
  def self.describe description, &block
    @description = description
    instance_eval &block
  end

  def self.it example, &block
    instance_eval &block
    print "\e[32m.\e[0m"
  rescue AssertionFailure => e
    puts "\e[31mF\e[0m\n#{@description} #{example}: \e[31m#{e.message}\e[0m"
  end

  def self.expect actual
    Expector.new(actual)
  end

  def self.eq expected
    EqMatcher.new(expected)
  end
end

class Expector
  def initialize actual
    @actual = actual
  end

  def to matcher
    matcher.call @actual
  end
end

class EqMatcher
  def initialize expected
    @expected = expected
  end

  def call actual
    raise AssertionFailure, "Expected #{@expected.inspect} but got #{actual.inspect}" unless @expected == actual
  end
end

class AssertionFailure < RuntimeError
end
