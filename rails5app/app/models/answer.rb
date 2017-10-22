class Answer < ApplicationRecord
    acts_as_votable
    belongs_to :user
    belongs_to :questions, optional: true, :dependent => :destroy 
    has_many :comments, :dependent => :destroy 
end
