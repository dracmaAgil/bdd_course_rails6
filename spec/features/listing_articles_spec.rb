require 'rails_helper'

RSpec.feature 'Listing Articles' do

  before do
    jonh = User.create!(email: 'jonh@example.com', password: 'password')
    @article1 = Article.create(title: 'First article', body: 'Lorem Ipsum dolor sit amet', user: jonh)
    @article2 = Article.create(title: 'Second article', body: 'Lorem Ipsum dolor sit amet', user: jonh)
  end


  scenario 'A user list all articles' do
    visit '/'

    expect(page).to have_content(@article1.title)
    expect(page).to have_content(@article1.body)
    expect(page).to have_content(@article2.title)
    expect(page).to have_content(@article2.body)
    expect(page).to have_link(@article1.title)
    expect(page).to have_link(@article2.title)
  end

  scenario 'A user has no articles' do
    Article.delete_all

    visit '/'

    expect(page).not_to have_content(@article1.title)
    expect(page).not_to have_content(@article1.body)
    expect(page).not_to have_content(@article2.title)
    expect(page).not_to have_content(@article2.body)
    expect(page).not_to have_link(@article1.title)
    expect(page).not_to have_link(@article2.title)

    within ('h1#no-articles') do
      expect(page).to have_content('No Articles Created')
    end
  end

end
