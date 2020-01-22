class Interface
attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
    end 

     
    def greet 
        puts "Welcome to Bayble, the answer to all new parents biggest fears in life!"
        prompt.select("Do you have an existing account or would you like to create an account?") do |menu|  
        menu.choice "New User",-> {User.new_user}
        menu.choice "Returning User", -> {User.returning_user}
    end
    end 
    def main_menu
        system "clear"
        
        prompt.select("Welcome #{self.user.name}! What are you interested in today?") do |menu| 
        menu.choice "See all Questions", -> {User.list_question_titles}
        menu.choice "Create a Question", ->  {User.create_questions}
        menu.choice "Edit a Question"
    end 
    end
    def get_title
        gets.chomp
    end
    def create_questions
        title = get_title
        user.id = Question.create(title: title)
        
    end 
    end  
    

