require 'rails_helper'

RSpec.describe 'Articles', type: :feature do

    describe 'View all articles' do 
        before {visit articles_path}
        it '- shows all articles in the body' do
            within 'body' do
                expect(page).to have_content('Hello %World!')
                expect(page).to have_content('New Article')
            end
        end
    end

    describe 'Create a new article' do
        it '- successfully create a new article' do
            visit 'articles/new' do
                fill_in 'title', with: 'Title'
                fill_in 'author', with: 'Author'
                fill_in 'content', with: 'Content'
                click_button 'Create Article'
                expect(page).to have_current_path(articles_path)
            end
        end
    end

end