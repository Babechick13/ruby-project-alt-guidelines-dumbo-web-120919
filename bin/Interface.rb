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
        menu.choice "Exit", -> {User.exit}  
    end
    end 

    def main_menu
        system "clear"
        
        prompt.select("Welcome #{self.user.name}! What are you interested in today?") do |menu| 
        menu.choice "See all Questions".magenta, -> {User.list_question_titles}
        menu.choice "Create a Question".magenta, ->  {self.create_questions}
        menu.choice "Edit a Question".magenta, -> {self.update}
        menu.choice "Exit".magenta, -> {User.exit}
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
    
   def update_query(question)
        response = gets.chomp
        question.update(title: response)
    end
    
    
    
    def update
        question = []
        Question.all.map do |q| 
            question << q
        end 
        prompt.select("Choose your question?") do |menu|
        menu.enum '.'
      
        menu.choice 'When will my baby start walking?',  -> {update_query(question[0])}
        menu.choice 'When will my child start talking?', -> {update_query(question[1])}
        menu.choice 'When can my child start eating solid foods?', -> {update_query(question[2])}
        menu.choice 'When will my child start babling?', -> {update_query(question[3])}
        menu.choice 'How long do I wait after I introduced my child to their first food to give it to them again?', -> {update_query(question[4])} 
        menu.choice 'When will my child start crawling?', -> {update_query(question[5])}
        menu.choice 'When kinds of solids can I start giving my child?', -> {update_query(question[6])}
        menu.choice 'How much formula should my baby be drinking at 3 months?', -> {update_query(question[7])}
        menu.choice 'What cream is best recommended when my baby gets a diaper rash?', -> {update_query(question[8])}
        menu.choice 'When should I start bathing my baby?', -> {update_query(question[9])} 
        
    end
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

   

    
   
   
    def exits
        Exit
        puts Rainbow("\n\n🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 Thanks for choosing Bayble See you later... ❤ 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑\n\n").magenta.bright
        
    end

    def babyble
    "system clear"
    greet
    main_menu
    create_questions
    update_question
    exit
    end
end 