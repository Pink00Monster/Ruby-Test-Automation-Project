require 'selenium-webdriver'
require 'rspec'

RSpec.describe 'Microsoft Denmark homepage' do

  before(:each) do
    @driver = Selenium::WebDriver.for :chrome
    @driver.manage.window.maximize
    @driver.get('https://www.microsoft.com/da-dk')
  end

  after(:each) do
    @driver.quit
  end

  it 'opens the Microsoft Denmark homepage' do
    expect(@driver.title).to include('Microsoft')
  end

  it 'opens Microsoft 365 page' do
    microsoft_365 = @driver.find_element(
      :css,
      '[aria-label="Køb Microsoft 365"]'
    )

    microsoft_365.click

    wait = Selenium::WebDriver::Wait.new(timeout: 10)

    wait.until do
      @driver.title.include?('Microsoft')
    end

    expect(@driver.current_url).to include('microsoft.com')
  end

end