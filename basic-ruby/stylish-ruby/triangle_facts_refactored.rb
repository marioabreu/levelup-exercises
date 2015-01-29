# Killer facts about triangles AWW YEAH
class Triangle
  attr_accessor :side1, :side2, :side3

  def initialize(side1,side2,side3)
    @side1 = side1
    @side2 = side2
    @side3 = side3
  end

  def equilateral
    side1 == side2 && side2 == side3
  end

  def isosceles
    [side1,side2,side3].uniq.length == 2
  end

  def scalene
    !(equilateral || isosceles) 
  end

  def recite_facts
    puts "#{equilateral_fact}", 
          "#{isosceles_fact}", 
          "#{scalene_fact}", 
          "#{angles_fact}",
          "#{right_triangle_fact}"
  end

  def calculate_angles(a,b,c)

    angleA = radians_to_degrees(rads(a,b,c))
    angleB = radians_to_degrees(rads(b,a,c))
    angleC = radians_to_degrees(rads(c,a,b))

    [angleA, angleB, angleC]
  end

  def rads(a,b,c)
    Math.acos((b**2 + c**2 - a**2) / (2.0 * b * c))
  end

  def radians_to_degrees(rads)
    (rads * 180 / Math::PI).round
  end

  def equilateral_fact
    'This triangle is equilateral!' if equilateral
  end

  def isosceles_fact
    'This triangle is isosceles! Also, that word is hard to type.' if isosceles 
  end

  def scalene_fact
    'This triangle is scalene and mathematically boring.' if scalene 
  end

  def angles_fact
    angles = self.calculate_angles(side1,side2,side3)
    'The angles of this triangle are ' + angles.join(',')
  end

  def right_triangle_fact
    angles = self.calculate_angles(side1,side2,side3)
    'This triangle is also a right triangle!' if angles.include? 90
  end
end

triangles = [
  [5,5,5],
  [5,12,13],
]
triangles.each { |sides|
  tri = Triangle.new(*sides)
  tri.recite_facts
}