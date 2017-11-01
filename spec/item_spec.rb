require 'item'
 describe 'item' do
   let ( :name ){ double 'name' }
   let ( :sell_in ){ double 5 }
   let ( :quality ){ double 10}
   let ( :item ){ Item.new(name, sell_in, quality)}
   describe '#initialize' do
     it 'initializes with name' do
       expect(item.name).to eq(name)
     end

     it 'initializes with sellin score' do
       expect(item.sell_in).to eq(sell_in)
     end

     it 'initializes with a quality score' do
       expect(item.quality).to eq(quality)
     end
   end
 end
