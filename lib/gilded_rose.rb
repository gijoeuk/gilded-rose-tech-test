require_relative './item.rb'

class GildedRose

  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.name == "Aged Brie"
        update_brie(item)
      elsif item == "Vest"
        update_sulfuras
      elsif item == "Backstage passes to a TAFKAL80ETC concert"
        update_backstage
      else
        update_conjoured
      end
    end
  end

  def update_brie(item)
    if item.sell_in > 0
      item.sell_in -= 1
    end
    item.quality <= 50 ? item.quality += 1 : return
  end

  def update_vest
    @quality <= 50 ? @quality += 1 : return
    @sell_in > 0 ? @sell_in -= 1 : return
  end

  def update_sulfuras

  end

  def update_backstage
    if @sell_in > 0 && @sell_in < 5
      @sell_in -= 1
      @quality += 3
    elsif @sell_in > 0 && @sell_in <10
      @quality += 2
      @sell_in -= 1
    elsif @sell_in > 0 && @sell_in >= 10
      @quality += 1
      @sell_in -= 1
    end
  end

  def update_conjoured
  end
end
#
#
#       if (item.name != 'Aged Brie') && (item.name != 'Backstage passes to a TAFKAL80ETC concert')
#         if item.quality > 0
#           if item.name != 'Sulfuras, Hand of Ragnaros'
#             item.quality = item.quality - 1
#           end
#         end
#       else
#         if item.quality < 50
#           item.quality = item.quality + 1
#           if item.name == 'Backstage passes to a TAFKAL80ETC concert'
#             if item.sell_in < 11
#               item.quality = item.quality + 1 if item.quality < 50
#             end
#             if item.sell_in < 6
#               item.quality = item.quality + 1 if item.quality < 50
#             end
#           end
#         end
#       end
#       if item.name != 'Sulfuras, Hand of Ragnaros'
#         item.sell_in = item.sell_in - 1
#       end
#       if item.sell_in < 0
#         if item.name != 'Aged Brie'
#           if item.name != 'Backstage passes to a TAFKAL80ETC concert'
#             if item.quality > 0
#               if item.name != 'Sulfuras, Hand of Ragnaros'
#                 item.quality = item.quality - 1
#               end
#             end
#           else
#             item.quality = item.quality - item.quality
#           end
#         else
#           item.quality = item.quality + 1 if item.quality < 50
#         end
#       end
#     end
#   end
# end
