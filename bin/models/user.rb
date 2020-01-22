class User < ActiveRecord::Base 
    has_many :answers
    has_many :questions, through: :answers 
    has_many :favorites

    def self.returning_user
        puts "what is your name"
        name = gets.chomp
        User.find_by(name: name)
    end
    def self.new_user
        puts "Welcome to Bayble! What is your name?"
        name = gets.chomp
        User.create(name: name)
    end  
     
    def list_questions
         puts "These are the questions for #{self.name}."
         question_title = self.questions.map do |question|
         question.title
        end
    end

    def self.list_question_titles
        puts Question.all.map(&:title)
    end 
    end 

