class Question < ActiveRecord::Base 
has_many :answers
has_many :users, through: :answers 
has_many :favorites 

def list_question_titles
    all.map(&:title)
end

end 