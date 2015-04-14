class ConeSection

  def initialize hsh
    @height = hsh[:height].to_f
    @base_diameter = hsh[:base_diameter].to_f
    @top_diameter = hsh[:top_diameter].to_f
  end

  def solve
    big_triangle_sides
  end

private
  
  def big_triangle_sides

    # solve the little sides
    little_a = @height
    little_b = @base_diameter - @top_diameter / 2
    little_c = Math.sqrt((little_a ** 2) + (little_b ** 2))

    # solve the big sides
    big_b = @base_diameter / 2
    coefficient = big_b / little_b
    big_a = little_a * coefficient
    big_c = little_c * coefficient

    {a: big_a, b: big_b, c: big_c}
  end

  def radians degrees
    degrees * Math::PI / 180
  end
end
