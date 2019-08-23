=begin
Start game player has a name and an initial bankroll
Player can go to different games via menu
Slots
High / Low
Player places bet and wins / loses (hint: rand)
Player's bankroll goes up and down with wins and losses

=end

require_relative 'card' 
require_relative 'dice'
require_relative 'deck'
require_relative 'slots'
require_relative 'outside'

require 'titleize'
# see if each file needs a separate line once in use


@people = []


class Casino_welcome
    def initialize
        wallet = @wallet
    end    
end

def greeting
    puts
    puts "Hello! Welcome to The Silver Fox. Please enter your name to continue."
    @name = gets.strip.titleize
    puts "Hello #{@name}!"
    puts "How much can you afford to lose?"
    puts "50? 100? 1000? 10,000?"
    greeting_options
    main_game_menu
end

def greeting_options
  print "$ "
  wallet_input = gets.strip
  pattern = /^(\d+\.?){1}(\d*){0,1}$/
  if pattern.match(wallet_input)
    @wallet = wallet_input.to_f
    printf("Nice! You now have $%.2f to play with. Let's choose a game!\n", @wallet)
  else
    puts "Invalid Input! Try Again"
    greeting_options
  end

  new_guest = {name: @name, wallet: @wallet}
  @people << new_guest

end

def main_game_menu
    puts "1) Play Games"
    puts "2) View Wallet"
    puts "3) Entertainment"
    puts "4) Horse Racing"
    puts "5) See Wins and Losses"
    puts "6) Visit Hotel"
    puts "8) Step Outside"
    menu_options
end

def menu_options
 user_input = gets.strip.to_i
    case user_input
    when 1
    game_menu
    when 2
    view_wallet
    when 3
    add_money
    when 4
    withdraw_money
    when 5
    wins_and_losses
    when 8
    outside_menu
    else
    puts "Invalid Response, Try Again"
    main_game_menu
    end

end

def game_menu
    puts 
    puts "Which game do you want to play?"
    puts "(Enter a number)"    
    puts "1) Party Slots"
    game_choice = gets.strip.to_i
    puts
    case game_choice
    when 1
    slot_machine1 #slots.rb
    else
    main_game_menu
    end
end


def view_wallet
    puts
    puts "You have $#{@wallet}"
    puts
    main_game_menu
end

greeting


 