class Interface
attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
    end 

     
    def greet 
       
        puts "Welcome to Bayble, the answer to all new parents biggest fears in life!".magenta
        prompt.select("Do you have an existing account or would you like to create an account?".magenta) do |menu|  
        menu.choice "New User",-> {User.new_user}
        menu.choice "Returning User", -> {User.returning_user}
        menu.choice "Exit", -> {exit}  
    end
    end 

    def main_menu
        system "clear"
        
        prompt.select("Welcome #{self.user.name}! What are you interested in today?") do |menu| 
        menu.choice "See all Questions".magenta, -> {User.list_question_titles}
        menu.choice "Create a Question".magenta, ->  {self.create_questions}
        menu.choice "Edit a Question".magenta
        menu.choice "Exit".magenta
    end 
    end

   
    def get_title
        gets.chomp
    end
    
    def create_questions
        title = get_title
        user.id = Question.create(title: title)
        self.user
    end
    
   
    def back_to_menu
        puts ("\nWould you like to go back to the menu page? (y/n)").magenta
        user_input = gets.chomp
        if user_input == "y"
        menu
        menu_choice
        elsif user_input == "n"
        puts ("Would you like to exit the app? (y/n)").magenta
        user_input = gets.chomp
        elsif user_input == "y"
        exit
        else
        menu
        menu_choice
    end
    end

   


    
   
   
    def exit
        Exit
        puts Rainbow("\n\n🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 Thanks for choosing Bayble See you later... ❤ 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑\n\n").magenta.bright
        
    end

    def babyble
    "system clear"
    greet
    main_menu
    create_questions
    exit
    end
end 