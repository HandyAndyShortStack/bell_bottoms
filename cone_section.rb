require "./triangle"

class ConeSection

  def initialize hsh
    @height = hsh[:height].to_f
    @base_diameter = hsh[:base_diameter].to_f
    @top_diameter = hsh[:top_diameter].to_f
  end

  def solve
    little_triangle = Triangle.new({
      a: (@base_diameter - @top_diameter) / 2,
      C: 90.to_f,
      b: @height
    }).solve
  end
end
