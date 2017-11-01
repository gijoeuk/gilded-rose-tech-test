require_relative './item.rb'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name == "Aged Brie"
        update_brie(item)
      elsif item.name == "+5 Dexterity Vest"
        update_vest(item)
      elsif item.name == "Backstage passes to a TAFKAL80ETC concert"
        update_backstage(item)
      elsif item.name == "Conjured Mana Cake"
        update_conjoured(item)
      end
    end
  end


  def update_brie(item)
    update_sell_in(item)
    item.quality < 50 ? item.quality += 1 : return
  end

  def update_vest(item)
    update_sell_in(item)
    item.quality -= 1 if item.quality > 0 && item.quality < 50
    item.quality -= 1 if item.sell_in < 0
  end

  def update_sulfuras(item)

  end

  def update_backstage(item)
    update_sell_in(item)
    item.quality += 1 if item.quality < 50
    item.quality += 1 if item.sell_in < 10 && item.quality < 50
    item.quality += 1 if item.sell_in < 5 && item.quality < 50
  end

  def update_conjoured(item)
    update_sell_in(item)
    item.quality -= 2 if item.quality > 0 && item.quality < 50
    item.quality -= 2 if item.sell_in < 0
  end

  def update_sell_in(item)
    item.sell_in -= 1
  end
end
