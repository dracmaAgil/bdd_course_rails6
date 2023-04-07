require 'rails_helper'

RSpec.describe "Articles", type: :request do
  before do
    @article = Article.create(title: 'First article', body: 'Lorem Ipsum dolor sit amet')
  end

  describe 'Get /articles/:id' do
    context 'with existing article' do
      before { get "/articles/#{@article.id}" }
    
      it 'handle existing article' do
        expect(response.status).to eq 200
      end
    end

    context 'with no existing article' do
      before { get "/articles/xxxxxx" }

      it 'handles non existing article' do
        expect(response.status).to eq 302
        flash_message = 'The article you are looking for could not be found'
        expect(flash[:alert]).to eq flash_message
      end
    end
  end
end
