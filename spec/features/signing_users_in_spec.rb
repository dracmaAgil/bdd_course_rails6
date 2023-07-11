require 'rails_helper'

RSpec.feature 'Users signin' do

  before do
    @jonh = User.create!(email: 'jonh@example.com', password: 'password')
  end

  scenario 'with valid credentials' do

    visit '/'

    click_link 'Sing in'

    fill_in 'Email', with: @jonh.email
    fill_in  'Password', with: @jonh.password

    click_button 'Log in'

    expect(page).to have_content('Signed in successfully.')
    # expect(page).to have_content("Signed in as #{@jonh.email}.")
    expect(page).not_to have_link('Sign in')
    expect(page).not_to have_link('Sign up')
  end

end
