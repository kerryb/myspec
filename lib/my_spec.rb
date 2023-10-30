class MySpec
  def self.describe description, &block
    instance_eval &block
  end

  def self.it description, &block
    instance_eval &block
    print "."
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
    matcher.run @actual
  end
end

class EqMatcher
  def initialize expected
    @expected = expected
  end

  def run actual
    raise "Expected: #{@expected.inspect}; got: #{actual.inspect}" unless actual == @expected
  end
end
