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
require_relative 'entertainment'
require_relative 'horse_racing'
require_relative 'hotel'
require 'titleize'
require 'tty-font'
require 'colorize'
require 'tty'


@people = []

def separator
  puts
end

def greeting
  # font = TTY::Font.new(:starwars)
  # pastel = Pastel.new
  # puts pastel.bold.italic.white.dim(font.write("SILVER", letter_spacing: 2))
  # puts pastel.bold.italic.red.dim(font.write("FOX", letter_spacing: 2))
  puts <<-'EOF'
         
  ******** **  **                         ********                 
  **////// //  /**                        /**/////                  
 /**        ** /** **    **  *****  ******/**        ******  **   **
 /*********/** /**/**   /** **///**//**//*/*******  **////**//** ** 
 ////////**/** /**//** /** /******* /** / /**////  /**   /** //***  
        /**/** /** //****  /**////  /**   /**      /**   /**  **/** 
  ******** /** ***  //**   //******/***   /**      //******  ** //**
 ////////  // ///    //     ////// ///    //        //////  //   // 
  
                 
  EOF
  puts "Hello! Welcome to The Silver Fox Casino. Please enter your name to continue."
  @name = gets.strip.titleize
  puts "Hello #{@name}!"
  puts "How much can you afford to lose?"
  puts "50? 100? 1000? 10,000?"
  greeting_options
  separator
  menu
end

def greeting_options
  user_input = gets.strip
  pattern = /^(\d+\.?){1}(\d*){0,1}$/
  if pattern.match(user_input)
    @wallet = user_input.to_f
    printf("Nice! You now have $%.2f to play with.\n", @wallet)
  else
    puts "You call that money?! Try Again!"
    greeting_options
  end
  new_guest = {name: @name, wallet: @wallet, wins: 0, losses: 0}
  @people << new_guest
end

def menu
  puts "What would you like to do?"
  puts "(Enter a number)"
  puts "1) Play Games"
  puts "2) Entertainment"
  puts "3) Horse Racing"
  puts "4) View Wallet"
  puts "5) Add Money"
  puts "6) Withdraw Money"
  puts "7) See Wins and Losses"
  puts "8) Visit Hotel"
  puts "9) Step Outside"
  menu_options
end

def menu_options
 user_input = gets.strip.to_i
  case user_input
  when 1
    separator
    game_menu
  when 2
    separator
    entertainment_menu
  when 3
    separator
    horse_racing_menu
  when 4
    separator
    view_wallet
  when 5
    separator
    add_money
  when 6
    separator
    withdraw_money
  when 7
    separator
    wins_and_losses
  when 8
    separator
    hotel_menu
  when 9
    separator
    outside_menu
  else
    puts "Invalid Response, Try Again"
    menu_options
  end
end

def wins_and_losses
  puts "Wins and losses will go here!"
  menu
end


def game_menu
  puts "Which game do you want to play?"
  puts "(Enter a number)"    
  puts "1) Party Slots"
  puts "2) Rollin 'n Dough"
  puts "3) Main Menu"
  game_choice = gets.strip.to_i
  case game_choice
  when 1
    separator
    slot_machine1 #slots.rb
  when 2
    separator
    dice_game_greeting
  when 3
    separator
    menu
  else
    puts "Sorry, I didn't catch that! What would you like to do?"
  end
end

def view_wallet
  printf("You have $%.2f to play with! Happy Gambling!\n", @wallet)
  separator
  menu
end

def add_money
  puts "Hello, #{@name}! How much would you like to add to your account?"
  user_input = gets.strip
  pattern = /^(\d+\.?){1}(\d*){0,1}$/
  if pattern.match(user_input)
    user_input = user_input.to_f
    @wallet = @wallet + user_input
    printf("You now have $%.2f to play with! Happy Gambling!\n", @wallet)
    separator
    menu
  else
    puts "Invalid Response! Please enter a number."
    add_money
  end
end

def withdraw_money
  puts "Hello, #{@name}! How much would you like to withdraw from your account?"
  check_wallet_withdrawal
  pattern = /^(\d+\.?){1}(\d*){0,1}$/
  if pattern.match(@user_input) 
    @user_input = @user_input.to_f
    @wallet = @wallet - @user_input
    printf("You now have $%.2f to play with! Happy Gambling!\n", @wallet)
    separator
    menu
  else
    puts "Invalid Response! Please enter a number."
    withdraw_money
  end
end

def check_wallet_withdrawal
  @user_input = gets.strip
  if @user_input.to_f > @wallet
    puts "Sorry, you don't have enough money in your account to do that!"
    puts "How much would you like to withdraw?"
    check_wallet_withdrawal
  else
  end
end

greeting

