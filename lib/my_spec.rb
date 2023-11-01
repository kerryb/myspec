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

  def self.xit *args
  end

  def self.expect actual
    Expector.new(actual)
  end

  def self.eq expected
    EqMatcher.new(expected)
  end

  def self.let name, &block
    @lets ||= {}
    @lets[name] = block
  end

  def self.method_missing name, &block
    @let_values ||= {}
    @let_values[name] ||= instance_eval &@lets[name]
  end
end

class Expector
  def initialize actual
    @actual = actual
  end

  def to matcher
    matcher.match @actual
  end

  def not_to matcher
    matcher.not_match @actual
  end
end

class EqMatcher
  def initialize expected
    @expected = expected
  end

  def match actual
    raise AssertionFailure, "Expected #{@expected.inspect} but got #{actual.inspect}" unless @expected == actual
  end

  def not_match actual
    raise AssertionFailure, "Expected #{@expected.inspect} not to equal #{actual.inspect}" if @expected == actual
  end
end

class AssertionFailure < RuntimeError
end
