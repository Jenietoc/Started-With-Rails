require 'rails_helper'

RSpec.describe "Articles", type: :request do

  current_user = User.first_or_create(email: 'juan@gmail.com', username:
  'juan', password: '123456')

  let(:valid_attributes) do
    {
      'id' => '1',
      'title' => 'Machine',
      'body' => 'good article about machines',
      'status' => 'public'
    }
  end

  let(:invalid_attributes) do
    {
      'id' => 'a',
      'title' => 'a',
      'body' => 'a',
      'status' => 'a'
    }
  end

  describe "GET /index" do
    it 'renders a succesful response' do
      article = Article.new(valid_attributes)
      article.user = current_user
      article.save
      get articles_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      article = Article.new(valid_attributes)
      article.user = current_user
      article.save
      get article_url(article)
      expect(response).to be_successful
    end
  end
end
