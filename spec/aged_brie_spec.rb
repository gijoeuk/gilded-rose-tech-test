require './lib/aged_brie.rb'

describe AgedBrie do
  let( :brie ){ AgedBrie.new }
  describe '#update_quality' do
    it 'should be an instance of agedbrie class' do
      expect(brie).to be_an_instance_of(AgedBrie)
    end
  #   it 'starts with a default quality of x' do
  #
  #   it 'does not allow quality to go beyond 50' do
  #
  #   it 'raises the quality score by 1 each time method is called' do
  #
  #   it 'reduces the sellin time by 1 each time method is called' do
  #
  #   end
  end
end
