class ConeSection
  def initialize hsh
    @height = hsh[:height].to_f
    @base_diameter = hsh[:base_diameter].to_f
    @top_diameter = hsh[:top_diameter].to_f
    @little_triangle_sides = little_triangle_sides
    @big_triangle_sides = big_triangle_sides
  end

  def solve
    big_triangle_sides
  end

private

  def angles
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

  def radians degrees
    degrees * Math::PI / 180
  end
end
