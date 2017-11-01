require './lib/brie.rb'

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name = Classname.new, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end
