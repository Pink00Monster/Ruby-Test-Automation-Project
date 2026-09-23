require 'rspec'
require_relative '../TestClass/dog'

RSpec.describe Dog do
  describe '#bark' do
    it 'returns the "Woof!"' do
      expect(subject.bark).to eq('Woof!')
    end
  end

  describe '#feed' do
    context 'when the dog is hungry'
      subject {described_class.new(hungry_level: 7)}

      it 'is no longer hungry' do
        subject.feed
        expect(subject).to_not be_hungry
      end
  end



  describe '#hungry?' do
    context 'when hungry_level is more than 5' do
      subject {described_class.new(hungry_level: 7)}

      it 'returns true' do
        expect(subject).to be_hungry
      end
    end

    context 'when hungry_level is 5 or less' do
      subject {described_class.new(hungry_level: 5)}

        it 'returns false ' do
        expect(subject).not_to be_hungry
      end
    end

  end
end