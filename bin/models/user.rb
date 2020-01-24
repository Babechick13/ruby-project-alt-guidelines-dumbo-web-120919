class User < ActiveRecord::Base 
    has_many :answers
    has_many :questions, through: :answers 
    has_many :favorites

    def self.returning_user
        puts "what is your name?"
        name = gets.chomp
        User.find_by(name: name)
    end
    def self.new_user
        puts "Welcome to Bayble! What is your name?"
        name = gets.chomp
        User.create(name: name)
    end  
     
    def see_all_questions
         puts "These are the questions for #{self.name}."
    
    end 
    def update_questions
        
        question_titles = Question.all.map do |question|
     puts question.title 
    
        end
    #     TTY::Prompt.new.select("These are the teams for #{self.name}. Choose 1 to see more details.")
    end     
end
    


   