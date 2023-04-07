require "rails_helper"

RSpec.feature 'Show an Article' do

  before do
    @article = Article.create(title: 'First article', body: 'Lorem Ipsum dolor sit amet')
  end

  scenario 'A user list all articles' do
    visit '/'
    click_link @article.title

    expect(page).to have_content(@article.title)
    expect(page).to have_content(@article.body)
    expect(current_path).to eq(article_path(@article))
  end

end
