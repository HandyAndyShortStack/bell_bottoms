class ConeSection
  def initialize hsh
    @height = hsh[:height].to_f
    @base_diameter = hsh[:base_diameter].to_f
    @top_diameter = hsh[:top_diameter].to_f
    @little_triangle_sides = little_triangle_sides
    @big_triangle_sides = big_triangle_sides
    @angles = angles
  end

  def solve
    angles
  end

private

  def angles
    a = @big_triangle_sides[:a]
    b = @big_triangle_sides[:b]
    c = @big_triangle_sides[:c]
    angle_a = Math.acos (((b ** 2) + (c ** 2) - (a ** 2)) / (2 * b * c)) 
    {
      a: angle_a.to_degrees,
      b: 90.0 - angle_a.to_degrees,
      c: 90.0
    }
  end

  def little_triangle_sides
    little_b = (@base_diameter - @top_diameter) / 2
    {
      a: @height,
      b: little_b,
      c: Math.sqrt((@height ** 2) + (little_b ** 2))
    }
  end
  
  def big_triangle_sides
    big_b = @base_diameter / 2
    coefficient = big_b / @little_triangle_sides[:b]
    {
      a: @little_triangle_sides[:a] * coefficient,
      b: @little_triangle_sides[:b] * coefficient,
      c: @little_triangle_sides[:c] * coefficient
    }
  end
end

class Numeric

  def to_degrees
    self * (1 / (Math::PI / 180))
  end

  def to_radians
    self * (Math::PI / 180)
  end
end
