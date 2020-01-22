class Interface
attr_accessor :prompt, :user

    def initialize
        @prompt = TTY::Prompt.new
    end 

     
    def greet 
        puts "Welcome to Bayble, the answer to all new parents biggest fears in life!"
        response = self.prompt.select("Do you have an existing account or would you like to create an account?", %w[New_User
        Returning_User
        ])
        greet_option(response)
    end 
    def greet_option(choice)
        case choice
        when "New_User"
        puts "Welcome new friend"
        when "Returning_User"
        puts "I'm glad you are enjoying Bayble!!!"
        end 
    end 
end