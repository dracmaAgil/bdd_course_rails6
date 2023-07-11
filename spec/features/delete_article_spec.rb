require 'rails_helper'

RSpec.feature 'Deleteing on Article' do
  before do
    jonh = User.create!(email: 'jonh@example.com', password: 'password')
    login_as(jonh)
    @article = Article.create(title: 'Title One', body: 'Body of article one', user: jonh)
  end

  scenario 'Deleting on article' do
    visit '/'

    click_link @article.title
    click_link 'Delete Article'

    expect(page).to have_content('Article has been deleted')
    expect(page.current_path).to eq(articles_path)
  end
end
