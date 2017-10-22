class Category < ApplicationRecord
    acts_as_followable
    has_many :questions
    has_attached_file :image, styles: { large: "200x200>", medium: "120x120>", small: "80x80>"}
    validates_attachment_content_type :image, content_type: /\Aimage/
end

