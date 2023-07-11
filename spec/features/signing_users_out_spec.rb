require 'rails_helper'

RSpec.feature 'Users signout' do

  before do
    @jonh = User.create!(email: 'jonh@example.com', password: 'password')
    
    visit '/'

    click_link 'Sing in'

    fill_in 'Email', with: @jonh.email
    fill_in  'Password', with: @jonh.password

    click_button 'Log in'
  end

  scenario 'with valid credentials' do

    visit '/'

    click_link 'Sign out'

    expect(page).to have_content('Signed out successfully.')
    expect(page).not_to have_content('Sign out')
  end

end
