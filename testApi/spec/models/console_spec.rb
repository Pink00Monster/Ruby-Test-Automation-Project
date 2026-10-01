require 'rails_helper'

RSpec.describe Console do
  subject(:console) { described_class.new(name: 'Test Console', manufacturer: 'Test Manufacturer') }
  describe 'validations' do
    describe 'name' do
      it 'is required' do
        expect(console).to be_valid
        console.name = nil       
        expect(console).to_not be_valid        
      end
    end

        describe 'manufacturer' do
      it 'is required' do
        expect(console).to be_valid
        console.manufacturer = nil
        expect(console).to_not be_valid    
      end
    end

    describe '#formatted_name' do
      it 'returns the name and manufacturer in a formatted string' do
        expect(console.formatted_name).to eq('Test Manufacturer Test Console')
      end
    end

    describe '.nintendo' do
      it 'returns ActiveRecord:Relation of consoles manufactured by Nintendo' do
        wii = described_class.create(name: 'Wii', manufacturer: 'Nintendo')
        switch = described_class.create(name: 'Switch', manufacturer: 'Nintendo')
        other_console = described_class.create(name: 'Other Console', manufacturer: 'Other')

        expect(described_class.nintendo).to contain_exactly(wii, switch)
        expect(described_class.nintendo).not_to include(other_console)
      end
    end
  end
end