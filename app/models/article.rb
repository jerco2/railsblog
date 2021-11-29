# id
# title 
# author
# content
# published
# publsihed_at
# created_at
# updated_at

class Article < ApplicationRecord
    validates :title, :author, :content, presence: true

    has_many :comments
end

