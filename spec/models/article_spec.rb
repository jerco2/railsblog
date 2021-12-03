require 'rails_helper'

RSpec.describe Article, type: :model do

    let!(:article) {Article.new}

    context 'Validations' do
        it '- is not a valid name' do
            article.content = "Test body"
            article.author = nil

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_hash.keys).to include(:author)
        end

        it '- should be unique' do
            Article.create(:title => 'Title', :author => 'Duplicate Name', :content => 'Content')
            article.author = 'Duplicate Name'

            expect(article).to_not be_valid
            expect(article.errors).to be_present
            expect(article.errors.to_hash.keys).to include(:author)
            expect(article.errors[:author]).to include('should be unique')
        
        end
    end

end