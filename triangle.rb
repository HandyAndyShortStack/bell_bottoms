class Triangle
  attr_reader :angles, :sides

  def initialize( options )
    @angles = [options[:A], options[:B], options[:C]]
    @sides = [options[:a], options[:b], options[:c]]
  end

  def angle sym
    angles[0] if sym == :A
    angles[1] if sym == :B
    angles[2] if sym == :C
  end

  def side sym
    sides[0] if sym == :a
    sides[1] if sym == :b
    sides[2] if sym == :c
  end

  def solve
    # AA
    if @angles.one?( &:nil? )
      @angles[@angles.index( nil )] = 180 - @angles.compact.inject( &:+ )
    end

    # AAS
    (0..2).each do |i|
      if !@sides[i] && @angles[i]
        (0..2).each do |j|
          if @angles[j] && @sides[j]
            @sides[i] = ( @sides[j] * Math.sin( @angles[i] ).abs ) / Math.sin( @angles[j] ).abs
          end
        end
      end
    end
    self
  end
end
