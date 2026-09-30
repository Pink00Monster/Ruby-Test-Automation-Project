require 'rails_helper'

RSpec.describe 'Consoles requests', type: :request do
  describe 'GET /consoles' do
    it 'returns an array of video games consoles' do
      get('/consoles')
      
      expect(response_json['consoles']).to contain_exactly(
                                    'NES',
                                    'SNES',
                                    'Wii',
                                    'Genesis',
                                    'Xbox',
                                    'Switch',
                                    'PS1',
                                    'PS2'
                                  )
    end

    it 'supports specifying consoles for a specific manufacturer' do
      get('/consoles', params: { manufacturer: 'Nintendo' })

      expect(response_json['consoles']).to contain_exactly(
                                    'NES',
                                    'SNES',
                                    'Wii',
                                    'Switch'
                                  )

      get('/consoles', params: { manufacturer: 'Sega' })     
      expect(response_json['consoles']).to contain_exactly(
                                    'Genesis'
                                  )

      get('/consoles', params: { manufacturer: 'Sony' })
      expect(response_json['consoles']).to contain_exactly(
                                    'PS1',
                                    'PS2'
                                  )
    end
  end
end