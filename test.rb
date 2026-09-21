require 'selenium-webdriver'
driver = Selenium::WebDriver.for :chrome
driver.get('https://www.google.com')
puts driver.title

sleep 5

driver.quit