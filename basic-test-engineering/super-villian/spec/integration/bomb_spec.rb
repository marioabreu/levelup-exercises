require_relative '../spec_helper'

feature 'User configures bomb', type: :feature do
  after(:each) do
    bomb.reset
  end

  scenario 'by inserting the activation and deactivation code' do
    visit '/bomb'

    fill_in('activation_code', :with => '1234')
    fill_in('deactivation_code', :with => '0000')
    click_on('send')
    expect(page).to have_content("The code configured was 1234 and the deactivation code is 0000")
  end
end

feature 'User first boots' do
  scenario 'the bomb should be deactivated' do
    visit '/bomb'

    expect(page).to have_content("Wired: false")
  end
end

feature 'User tries to wire the bomb' do

  scenario 'by entering the wrong activation code.' do
    visit '/bomb'

    fill_in('activation_code', :with => '1111')
    fill_in('deactivation_code', :with => '9000')
    click_on('send')

    visit '/wire'

    fill_in('activation_code', :with => '10101')
    click_on('Activate')
    expect(page).to have_content("Wrong code!")
  end

  scenario 'by entering the right activation code.' do
    visit '/bomb'

    fill_in('activation_code', :with => '1111')
    fill_in('deactivation_code', :with => '9000')
    click_on('send')

    visit '/wire'

    fill_in('activation_code', :with => '1111')
    click_on('Activate')
    expect(page).to have_content("Bomb wired!")
  end

  scenario 'And, once it is activated, it can\'t be activated again!' do
    visit '/bomb'

    fill_in('activation_code', :with => '1111')
    fill_in('deactivation_code', :with => '9000')
    click_on('send')

    visit '/wire'
    fill_in('activation_code', :with => '1111')
    click_on('Activate')

    expect(page).to have_text 'The bomb is already wired!'
  end
end
