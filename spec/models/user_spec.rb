require 'rails_helper'

RSpec.describe User, type: :model do

  current_user = User.first_or_create(email: 'juan@gmail.com', username:
    'Juan', password: '123456')

  let(:valid_attributes_article) do
    {
      'id' => '1',
      'title' => 'Machine',
      'body' => 'good article about machines',
      'status' => 'public'
    }
  end

  let(:valid_attributes_comment) do
    {
      'id' => '1',
      'body' => 'nice article',
      'status' => 'public'
    }
  end

  it "check email" do
    email_validate = current_user.email =~ /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
    expect(email_validate).to eq(0)
  end

  it 'name cant be blank' do
    expect(current_user.username.blank?).to eq(false)
  end

  it 'validate password' do
    current_user.password = '123456'
    expect(current_user.password.size).to be > 5
  end

  it 'count articles' do
    expect(current_user.articles.size).to be == 0
    article = current_user.articles.create(valid_attributes_article)
    article.save
    expect(current_user.articles.size).to be == 1
  end

  it 'count comments' do
    expect(current_user.comments.size).to be == 0
    article = current_user.articles.create(valid_attributes_article)
    article.save
    comment = article.comments.create(valid_attributes_comment)
    current_user.comments << comment
    expect(current_user.comments.size).to be == 1
  end
end
