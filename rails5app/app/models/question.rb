class Question < ApplicationRecord
    acts_as_votable
    belongs_to :user
    belongs_to :category, optional: true
    has_many :answers, :dependent => :destroy
end
