require_relative './item.rb'

class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name == 'Sulfuras, Hand of Ragnaros'
        update_sulfuras(item)
      elsif item.name == 'Backstage passes to a TAFKAL80ETC concert'
        update_backstage(item)
      elsif item.name == 'Conjured Mana Cake'
        update_conjoured(item)
      elsif item.name == 'Aged Brie'
        update_brie(item)
      else
        update_normal(item)
      end
    end
  end

  private

  def update_brie(item)
    update_sell_in(item)
    quality_up1(item) if item.quality < 50
  end

  def update_backstage(item)
    update_sell_in(item)
    quality_up1(item) if quality_range(item) == true
    quality_up1(item) if item.sell_in < 10 && item.quality < 50
    quality_up1(item) if item.sell_in < 5 && item.quality < 50
  end

  def update_conjoured(item)
    update_sell_in(item)
    quality_down2(item) if item.quality > 1 && item.quality < 50
  end

  def update_sulfuras(item); end

  def update_normal(item)
    update_sell_in(item)
    quality_down1(item) if quality_range(item) == true
    quality_down1(item) if item.sell_in < 0
  end

  def update_sell_in(item)
    item.sell_in -= 1
  end

  def quality_down1(item)
    item.quality -= 1
  end

  def quality_down2(item)
    item.quality -= 2
  end

  def quality_up1(item)
    item.quality += 1
  end

  def quality_range(item)
    item.quality < 50 && item.quality > 0
  end
end
