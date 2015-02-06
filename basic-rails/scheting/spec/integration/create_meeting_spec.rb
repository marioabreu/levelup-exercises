require 'rails_helper'

feature 'Create a meeting' do
  scenario 'successefully create a meeting' do

    room = Room.create(name: "Room1")
    user = User.create(name: "User1")

    visit '/rooms'
    click_on 'New meeting'

    # fill_form(:meeting, { title: 'Meeting 1', begins: DateTime.new(2015, 2, 6, 10, 30), ends: DateTime.new(2015, 2, 6, 11, 30), user_id: user.id, room_id: room.id })
    # click_on submit(:meeting)

    fill_in 'meeting_title', :with => 'Meeting 1'
    select 2015, from: 'meeting_begins_1i'
    select "February", from: 'meeting_begins_2i'
    select 6, from: 'meeting_begins_3i'
    select 10, from: 'meeting_begins_4i'
    select 30, from: 'meeting_begins_5i'

    select 2015, from: 'meeting_ends_1i'
    select "February", from: 'meeting_ends_2i'
    select 6, from: 'meeting_ends_3i'
    select 11, from: 'meeting_ends_4i'
    select 30, from: 'meeting_ends_5i'

    select user.id, from: 'meeting_user_id'
    select room.id, from: 'meeting_room_id'
    click_button 'Save Meeting'

    expect(page).to have_content('Successfully created!')


  end
end
