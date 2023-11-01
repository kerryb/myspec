class MySpec
  def self.describe description, &block
    instance_eval &block
  end

  def self.it description, &block
    if instance_eval &block
      print "\e[32m.\e[0m"
    else
      print "\e[31mF\e[0m"
    end
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
    matcher.matches? @actual
  end
end

class EqMatcher
  def initialize expected
    @expected = expected
  end

  def matches? actual
    @expected == actual
  end
end
