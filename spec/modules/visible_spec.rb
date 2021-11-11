require 'rails_helper'

RSpec.describe Visible, type: :module do
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

    context 'Visible with articles' do
        it 'with public expects false' do
            article = current_user.articles.create(valid_attributes_article)
            article.save
            expect(article.archived?).to eq(false)
        end
    
        it 'with archived expects true' do
            article = current_user.articles.create(valid_attributes_article)
            article.status = 'archived'
            article.save
            expect(article.archived?).to eq(true)
        end 
    end

    context 'Visible with comments' do
        it 'with public expects false' do
            article = current_user.articles.create(valid_attributes_article)
            article.save
            comment = article.comments.create(valid_attributes_comment)
            current_user.comments << comment
            expect(comment.archived?).to eq(false)
        end
    
        it 'with archived expects true' do
            article = current_user.articles.create(valid_attributes_article)
            article.save
            comment = article.comments.create(valid_attributes_comment)
            comment.status = 'archived'
            current_user.comments << comment
            expect(comment.archived?).to eq(true)
        end 
    end
end