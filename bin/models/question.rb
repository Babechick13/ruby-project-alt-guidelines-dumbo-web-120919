class Question < ActiveRecord::Base 
has_many :answers
has_many :users, through: :answers 
has_many :favorites 

def list_question_titles
    all.map(&:title)
end
def update_question(new_title)
    self.update(title: new_title)
end
end 