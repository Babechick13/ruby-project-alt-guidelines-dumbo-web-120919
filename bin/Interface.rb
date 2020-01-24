class Interface
attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
    end 

     
    def greet 
       
        display_title
        prompt.select("Do you have an existing account or would you like to create an account?".magenta) do |menu|  
        menu.choice "New User",-> {User.new_user}
        menu.choice "Returning User", -> {User.returning_user}
        menu.choice "Exit", -> {self.exit}
    end
    # binding.pry
    end 

    def main_menu
        system "clear"

        # binding.pry
        prompt.select("Welcome #{self.user.name}! What are you interested in today?") do |menu| 
        menu.choice "See all Questions".magenta, -> {self.see_all_questions}
        menu.choice "Create a Question".magenta, ->  {self.create_questions}
        menu.choice "Edit a Question".magenta, -> {self.update}
        menu.choice "Delete a Question".magenta, -> {self.delete_a_question}
        menu.choice "Exit".magenta, -> {User.exit}
    end 
    end




    def see_all_questions
        # binding.pry
        answer = prompt.select("Choose your question") do |menu|
            # menu.enum '.'
          
            menu.choice Question.all[0].title, Question.all[0].answers[0].title
            menu.choice Question.all[1].title, Question.all[1].answers[0].title
            menu.choice Question.all[2].title, Question.all[2].answers[0].title
            menu.choice Question.all[3].title, Question.all[3].answers[0].title
            menu.choice Question.all[4].title, Question.all[4].answers[0].title
            menu.choice Question.all[5].title, Question.all[5].answers[0].title
            menu.choice Question.all[6].title, Question.all[6].answers[0].title
        #     menu.chice Question.all[7].title, Question.all[7].answers[0].title
        #     menu.choice Question.all[8].title, Question.all[8].answers[0].title
        #     menu.choice Question.all[9].title, Question.all[9].answers[0].title
            
          
    end
    puts answer
    sleep(3)
    main_menu
    end 







    def get_title
        gets.chomp
    end
    
    def create_questions
        title = get_title
        user.id = Question.create(title: title)
        self.user
        back_to_menu
    end
    
    def update_query(question)
        response = gets.chomp
        question.update(title: response)
        # binding.pry
        main_menu
        
    end
    
   
    
    def update
        question = []
        Question.all.map do |q| 
            question << q
        end 
        prompt.select("Choose your question?") do |menu|
        menu.enum '.'
      
        menu.choice 'When will my baby start walking?', -> {update_query(question[0])}
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
    sleep(3)
    main_menu
    end 

    def delete_a_question
        Question.first.destroy
        back_to_menu
    end 
    
    
    def back_to_menu
        puts ("\nWould you like to go back to the menu page? (y/n)").magenta
        user_input = gets.chomp
        if user_input == "y"
        main_menu
        menu_choice
        elsif user_input == "n"
        puts ("Would you like to exit the app? (y/n)").magenta
        user_input = gets.chomp
        elsif user_input == "y"
        exit
        else
        main_menu
        menu_choice
    end
    end

  

    def display_title
        puts "
        .------..------..------..------..------..------..------.       .------..------.       .------..------..------..------..------..------.
        |W.--. ||E.--. ||L.--. ||C.--. ||O.--. ||M.--. ||E.--. | .-.   |T.--. ||O.--. | .-.   |B.--. ||A.--. ||Y.--. ||B.--. ||L.--. ||E.--. |
        | :/\: || (\/) || :/\: || :/\: || :/\: || (\/) || (\/) |((5))  | :/\: || :/\: |((5))  | :(): || (\/) || (\/) || :(): || :/\: || (\/) |
        | :\/: || :\/: || (__) || :\/: || :\/: || :\/: || :\/: | '-.-. | (__) || :\/: | '-.-. | ()() || :\/: || :\/: || ()() || (__) || :\/: |
        | '--'W|| '--'E|| '--'L|| '--'C|| '--'O|| '--'M|| '--'E|  ((1))| '--'T|| '--'O|  ((1))| '--'B|| '--'A|| '--'Y|| '--'B|| '--'L|| '--'E|
        `------'`------'`------'`------'`------'`------'`------'   '-' `------'`------'   '-' `------'`------'`------'`------'`------'`------'
        "                    
    end
    
    def exit
        system("clear")
        puts("\n\n🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 Thanks for choosing Bayble See you later... ❤ 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑 🦑\n\n")
    end
    end  