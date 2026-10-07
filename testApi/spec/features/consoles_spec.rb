require 'rails_helper'

RSpec.describe "Consoles features"do
  describe 'viewing the index' do
      it 'lists all of the consoles' do
        Console.create!(name: 'Playstation 5', manufacturer: 'Sony')
        Console.create!(name: 'Xbox Series X', manufacturer: 'Microsoft')

        visit('/')
        click_link('Consoles')

        expect(page).to have_content('Playstation 5 by Sony')
        expect(page).to have_content('Xbox Series X by Microsoft')
      end     
  end
  describe 'adding a new console' do
    it 'adds the console to the list of consoles' do
            visit('/')
            click_link('Consoles')
            click_link('Add a New Console')

            expect(current_path).to have_content('/consoles/new')

            fill_in('Name', with: 'Playstation Vita')
            fill_in('Manufacturer', with: 'Sony')
            click_button('Create Console')

            expect(page).to have_content('Playstation Vita by Sony')
            expect(current_path).to have_content('/consoles')
    end
    
  end
end