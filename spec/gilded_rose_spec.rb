require './lib/gilded_rose.rb'


describe GildedRose do
  describe "#update_quality" do
    let ( :vest) { Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20) }
    let ( :brie ) { Item.new(name="Aged Brie", sell_in=2, quality=0) }
    let ( :elixir ) { Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7) }
    let ( :sulfuras ) { Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80) }
    let ( :backstage15 ) { Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20) }
    let ( :backstage10 ) { Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49) }
    let ( :backstage5 ) { Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49) }
    let ( :conjoured ) { Item.new(name="Conjured Mana Cake", sell_in=3, quality=6) }

    # What does the test need to do?

    # AgedBrie
    # increase quality with each update_quality
    # decrease sell_in with each update_quality

    # +5 Dexterity Vest
    # decrease quality with each update_quality
    # decrease sell_in with each update_quality
    # double rate of decline once sell_in = 0

    # Elixir of the mongoose
    # decrease quality with each update_quality
    # decrease sell_in with each update_quality
    # double rate of decline once sell_in = 0

    # +5 sulfuras
    # doesn't change quality with each update_quality
    # decrease sell_in with each update_quality
    # double rate of decline once sell_in = 0

    # backstage passes
    # decrease quality with each update_quality
    # decrease sell_in with each update_quality
    # double rate of quality once sell_in < 10
    # triple rate of quality once sell_in < 5

    # conjoured
    # decrease quality at twice the rate
    # decrease sell_in with each update_quality
    # double rate of quality once sell_in < 10
    # triple rate of quality once sell_in < 5


    it "does not change the name" do
      items = [Item.new("foo", 0, 0)]
      GildedRose.new(items).update_quality()
      expect(items[0].name).to eq "foo"
    end

    it "has a method to change sellin by 1" do
      items = [Item.new("Aged Brie", 2, 0)]
      gildedrose = GildedRose.new(items)
      expect(gildedrose.update_quality).to change{.sell_in}.by(1)
    end
  end
end
