require './lib/gilded_rose.rb'

describe GildedRose do
  describe '#update_quality' do
    let ( :vest) { Item.new(name = '+5 Dexterity Vest', sell_in = 10, quality = 20) }
    let ( :brie) { Item.new(name = 'Aged Brie', sell_in = 2, quality = 0) }
    let ( :sulfuras) { Item.new(name = 'Sulfuras, Hand of Ragnaros', sell_in = 0, quality = 80) }
    let ( :backstage15) { Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 15, quality = 20) }
    let ( :backstage10) { Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 10, quality = 49) }
    let ( :backstage5) { Item.new(name = 'Backstage passes to a TAFKAL80ETC concert', sell_in = 5, quality = 49) }
    let ( :conjoured) { Item.new(name = 'Conjured Mana Cake', sell_in = 3, quality = 6) }
    let ( :items) { [vest, brie, sulfuras, backstage15, backstage10, backstage5, conjoured] }
    let ( :gilded) { GildedRose.new(items) }

    # Infrastructure test

    it 'does not change the name' do
      items = [Item.new('foo', 0, 0)]
      GildedRose.new(items).update_quality
      expect(items[0].name).to eq 'foo'
    end

    # Brie

    it 'reduces Brie sell_in by 1 with each update' do
      expect { gilded.update_quality }.to change { brie.sell_in }.by(-1)
    end

    it 'increases Brie quality by 1 with each update' do
      expect { gilded.update_quality }.to change { brie.quality }.by(1)
    end

    it 'cannot pass upper limit for quality' do
      50.times do
        gilded.update_quality
      end
      expect { gilded.update_quality }.not_to change { brie.quality }
    end

    # Vest
    it 'reduces Vest sell_in by 1 with each update' do
      expect { gilded.update_quality }.to change { vest.sell_in }.by(-1)
    end

    it 'reduces Vest quality by 1 with each update' do
      expect { gilded.update_quality }.to change { vest.quality }.by(-1)
    end

    it 'double the rate of deterioration after sell in reached' do
      10.times do
        gilded.update_quality
      end
      expect { gilded.update_quality }.to change { vest.quality }.by(-2)
    end

    # Sulfuras
    it 'sell_in does not change with update_quality' do
      expect { gilded.update_quality }.not_to change { sulfuras.sell_in }
    end

    it 'quality does not change with update_quality' do
      expect { gilded.update_quality }.not_to change { sulfuras.quality }
    end

    it 'cannot change upper limit for quality' do
      expect { gilded.update_quality }.not_to change { sulfuras.quality }
    end

    # Backstage passes
    it 'reduces sell_in by 1 with each update' do
      expect { gilded.update_quality }.to change { backstage15.sell_in }.by(-1)
    end

    it 'increases quality by 1 with each update' do
      expect { gilded.update_quality }.to change { backstage15.quality }.by(1)
    end

    it 'double the rate of quality growth when sell_in is less than 10' do
      5.times do
        gilded.update_quality
      end
      expect { gilded.update_quality }.to change { backstage15.quality }.by(2)
    end

    it 'trebles the rate of quality growth when sell_in is less than 5' do
      10.times do
        gilded.update_quality
      end
      expect { gilded.update_quality }.to change { backstage15.quality }.by(3)
    end

    it 'cannot pass upper limit for quality' do
      gilded.update_quality
      expect { gilded.update_quality }.not_to change { backstage5.quality }
    end

    # Conjoured
    it 'reduces Conjoured sell_in by 1 with each update' do
      expect { gilded.update_quality }.to change { conjoured.sell_in }.by(-1)
    end

    it 'increases Conjoured quality by 2 with each update' do
      expect { gilded.update_quality }.to change { conjoured.quality }.by(-2)
    end
  end
end
