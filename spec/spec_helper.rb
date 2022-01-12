require "capybara"
require "capybara/rspec"
require "selenium-webdriver"
require "rspec/expectations"
require "rspec"

RSpec.configure do |config| 
  config.include Capybara::DSL  
  config.include Capybara::RSpecMatchers

  config.before(:example) do
      page.current_window.resize_to(1280,800)
  end

  # config.after(:example) do |e|
  #   nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ', '_')
  #   page.save_screenshot('log/' + nome + '.png')
  # end

  config.after(:example) do |e|
    nome = e.description.gsub(/[^A-Za-z0-9 ]/, '').tr(' ', '_')
    page.save_screenshot('log/' + nome + '.png') if e.exception
  end

end
Capybara.configure do |config|
  # digo que o driver padrao eh o do selenium.
  config.default_driver = :selenium_chrome 
  # defino a url padrao.
  config.app_host = "https://training-wheels-protocol.herokuapp.com"
  # defino o tempo maximo de espera para os elementos.
  config.default_max_wait_time = 30
end