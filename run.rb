
require_relative './config/environment'

cli = Interface.new
user_object = cli.greet


while !user_object 
    user_object = cli.greet
 end

cli.user = user_object

choice = cli.main_menu
 

#  binding.pry
 "done"