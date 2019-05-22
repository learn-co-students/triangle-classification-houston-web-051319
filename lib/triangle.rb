require 'pry'

class Triangle
  attr_reader :side_lengths

  @@all = []
  def self.all
    @@all
  end

  def initialize(side1,side2,side3)
    @side_lengths = [side1,side2,side3].sort
    self.class.all << self
  end

  def number_checker
    self.side_lengths.any? do |num|
      num <= 0
    end
  end
  
  def comparison_checker
    self.side_lengths[0]+self.side_lengths[1] <= self.side_lengths[2]
  end

  def all_checker
    if self.number_checker || self.comparison_checker
      raise TriangleError
    end
  end

  def kind
    self.all_checker
    case self.side_lengths.uniq.count
    when 1
      return :equilateral
    when 2
      return :isosceles
    when 3
      return :scalene
    end
  end

  class TriangleError < StandardError
  end

end
