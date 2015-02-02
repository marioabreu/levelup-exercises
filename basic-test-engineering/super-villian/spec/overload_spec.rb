
require_relative 'spec_helper'

feature 'insert bomb code' do 
  scenario 'activate a bomb' do
    visit "/bomb"

    expect(page).to have_selector("input")
  end

  scenario 'default state of the bomb is deactivated' do 
    new_bomb = Bomb.new
    wire = Wire.new(new_bomb)

    expect(wire.activated?).to be false
  end

  scenario 'default code of a bomb is 1234' do
    new_bomb = Bomb.new
    
    expect(new_bomb.code).to be "1234"
  end

  scenario 'the code must be a numeric code' do
    new_bomb = Bomb.new_bomb
    visit "/bomb"
  end

end