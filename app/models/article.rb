# id
# title 
# author
# content
# published
# publsihed_at
# created_at
# updated_at

class Article < ApplicationRecord
    validates :author, uniqueness: {scope: 'author', message: 'should be unique'}
    validates :title, :author, :content, presence: true
    has_many :comments

    has_and_belongs_to_many :tags


    before_validation :set_default_content 
    after_create :set_default_comment

    def set_default_content
        self.content = "Default content" if self.content.blank? || self.content.nil?
    end

    def set_default_comment
        Comment.create(article: self, content: 'Good job!')
    end
end

