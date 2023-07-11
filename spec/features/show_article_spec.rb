require 'rails_helper'

RSpec.feature 'Show an Article' do

  before do
    jonh = User.create!(email: 'jonh@example.com', password: 'password')
    login_as(jonh)
    @article = Article.create(title: 'First article', body: 'Lorem Ipsum dolor sit amet', user: jonh)
  end

  scenario 'A user list all articles' do
    visit '/'
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end

end
