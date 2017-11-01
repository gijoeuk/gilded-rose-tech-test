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
    if item.sell_in < 5 && item.quality < 48
      item.quality += 3
    elsif item.sell_in < 10 && item.quality < 49
      item.quality += 2
    elsif item.quality < 50
      item.quality += 1
    else
      return
    end
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
