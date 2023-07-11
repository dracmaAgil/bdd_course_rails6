require 'rails_helper'

RSpec.feature 'Editing on a article' do

  before do
    jonh = User.create!(email: 'jonh@example.com', password: 'password')
    login_as(jonh)
    @article = Article.create(title: 'Title One', body: 'Body of article one', user: jonh)
  end

  scenario 'A User update on article' do
    visit '/'

    click_link @article.title
    click_link 'Edit Article'

    fill_in 'Title', with: 'Updated Title'
    fill_in 'Body', with: 'Updated Body of Article'

    click_button 'Update Article'

    expect(page).to have_content('Article has been updated')
    expect(page.current_path).to eq(article_path(@article))
  end

  scenario 'A user fails to update on a article' do
    visit '/'

    click_link @article.title
    click_link 'Edit Article'

    fill_in 'Title', with: ''
    fill_in 'Body', with: 'Updated Body of Article'

    click_button 'Update Article'

    expect(page).to have_content('Article has not been updated')
    expect(page.current_path).to eq(article_path(@article))
  end
end