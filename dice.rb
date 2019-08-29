
@user_rolls
@computer_rolls


def dice_game_greeting
 font = TTY::Font.new(:doom)
 pastel = Pastel.new
 puts pastel.bold.italic.red.dim(font.write("Rollin 'n Dough", letter_spacing: 2))

 puts "Hello #{@name}! Are you up for a challenge?".colorize(:light_blue)
 separator
 puts "The rules of this game are pretty simple.".colorize(:green)
 separator
 dice_game_rules
 separator
 puts "Are you up for the challenge? (y/n)".colorize(:light_blue)
 dice_game_options
end

def dice_game_options
 yes_or_no = gets.strip.capitalize
 case yes_or_no
 when "Y"
   dice_check_wallet
 when "N"
   puts "Ok, see you next time!".colorize(:green)
   menu
 when "R"
   dice_game_rules
   puts "So are you ready to play? (y/n)"
   dice_game_options
 else
   puts "Sorry, what was that? Type 'y' for yes or 'n' for no!"
   dice_game_options
 end
end

def dice_game_rules
 puts "***   RULES    ***"
 puts "The starting bet is $10 from each of us."
 puts "You'll be facing me in a game of chance. We will each roll a die three times." 
 puts "There are three ways to win. The first one, lets call it \"Highs\", is simply having the combination of all three of your rolls "
 puts "be the highest!"
 puts "The next ways is to roll all evens or all odds. It makes sense to call this one \"Evens or Odds!\""
 puts "Evens or Odds beats Highs, but if both you and I get Even or Odds, Highs would pick the winner!"
 puts "The last way to win is to roll all three of the same number. This beats Even or Odds AND Highs, but once again will default to "
 puts "Highs in the result of a tie."
 puts "For all other ties, a die will be rolled and whoever has the highest number from that roll will win."
 puts "This can continue as many times as needed to break the tie!"
 puts "Between each roll, we will both have a chance to increase the amount of the bet by up to $50."
 puts "If one player is unwilling to raise the the amount set by the other player, they will lose the game and all money will be awarded "
 puts "to the other player."
 puts "To see these rules again, just type \"r\" at any time!"
end

def dice_check_wallet
 if @wallet >= 110.00
   @wallet = @wallet - 10
   @pot = 20
   printf("Your new balance is $%.2f.\n", @wallet)
   separator
   roll
 else
   puts "***   NOT ENOUGH FUNDS    ***"
   puts "Win money in other games & come back"
   separator
   menu
 end
end

def roll
 puts <<-'EOF'

   .-------.    ______
  /   o   /|   /\     \
 /_______/o|  /o \  o  \
 | o     | | /   o\_____\
 |   o   |o/ \o   /o    /
 |     o |/   \ o/  o  /
 '-------'     \/____o/

 EOF
 puts "Ok, let's roll!"
 puts "Press the Enter key to roll!"
 first_roll_options
end

def first_roll_options
 user_input = gets.strip
 if user_input == ''
   @user_r1 = 1 + rand(6)
   @user_rolls = @user_r1
   puts "Your roll: #{@user_r1}. Roll Total: #{@user_rolls}"
   @computer_r1 = 1 + rand(6)
   @computer_rolls = @computer_r1
   puts "My roll: #{@computer_r1}. Roll Total: #{@computer_rolls}"
   computer_assessment_first_round
   roll_two
 else
   puts "Pfft. The die landed on the floor. Roll again!"
   first_roll_options
 end
end

def computer_assessment_first_round
 if @computer_rolls > @user_rolls
   @computer_winning = true
 else
   @computer_winning = false
 end
 puts "How much would you like to increase the amount of the bet (up to 50)? Enter '0' to keep it the same!"
 user_raise_bet
end

def user_raise_bet
  @user_raise = gets.strip.to_f
  if @user_raise == 0
    raise_the_bet
  elsif @user_raise > 0.00 && @user_raise <= 50
    computer_accept_or_reject
  else
    puts "I'm sorry, how much would you like to raise the bet?"
    user_raise_bet
  end
 end

def raise_the_bet
  if @computer_winning == true
    puts "I would like to raise the bet by $10. Do you want to accept, or walk away? If you walk away I keep all the money wagered so far."
    puts "(y/n)"
    raise_the_bet_computer_options
  elsif @computer_winning == false
    puts "Alright, let's keep rolling then!"
    roll_two
  else
  end
 end 

 def raise_the_bet_computer_options
  user_input = gets.strip.capitalize
  if user_input == 'Y'
    @pot = @pot + 20.00
    @wallet = @wallet - 10.00
    printf("The pot has been increased to $%.2f, and your new balance is $%.2f\n", @pot, @wallet)
    roll_two
  elsif user_input == 'N'
    @wallet = @wallet - @pot
    printf("Ok, good game! Your new balance is $%.2f. I'll see you next time!\n", @wallet)
    menu
  else
    puts "What was that? Enter 'y' for yes or 'n' for no!"
    raise_the_bet_computer_options
  end
 end

 def computer_accept_or_reject
  if @computer_r1 + 3 < @user_r1
    @wallet = @wallet + @pot
    printf("I'm pulling out! You won the round!! You won $%.2f, and your new balance is $%.2f! Congratulations!", @pot, @wallet)
    @pot = 0
    menu
  else
    @pot = @pot + (@user_raise * 2)
    @wallet = @wallet - @user_raise
    printf("Deal! The pot is now $%.2f, and your balance in now $%.2f.\n", @pot, @wallet)   
    roll_two
  end
 end 
       
def roll_two
 puts "Ok, let's roll!"
 puts "Press the Enter key to roll!"
 second_roll_options
end

def second_roll_options
 user_input = gets.strip
 if user_input == ''
   @user_r2 = 1 + rand(6)
   @user_rolls = @user_rolls + @user_r2
   puts "Your roll: #{@user_r2}. Roll Total: #{@user_rolls}"
   @computer_r2 = 1 + rand(6)
   @computer_rolls = @computer_rolls + @computer_r2
   puts "My roll: #{@computer_r2}. Roll Total: #{@computer_rolls}"
   computer_assessment_second_round
 else
   puts "Pfft. The die landed on the floor. Roll again!"
   second_roll_options
 end
end

def computer_assessment_second_round
 if @computer_rolls > @user_rolls && @user_r1 != @user_r2
   @computer_winning = true
 elsif @computer_r1 % 2 == @computer_r2 && @user_r1 != @user_r2 && @user_rolls < 10
   @computer_winning = true
 else
   @computer_winning = false
 end
 puts "How much would you like to increase the amount of the bet (up to 50)? Enter '0' to keep it the same!"
 user_raise_bet_round_two
end

def user_raise_bet_round_two
 @user_raise = gets.strip.to_f
 if @user_raise == 0
   raise_the_bet_round_two
 elsif @user_raise > 0.00 && @user_raise <= 50
   computer_accept_or_reject_roll_two
 else
   puts "I'm sorry, how much would you like to raise the bet?"
   user_raise_bet_round_two
 end
end 

def raise_the_bet_round_two
 if @computer_winning == true
   puts "I would like to raise the bet by $10. Do you want to accept, or walk away? If you walk away I keep all the money wagered so far."
   puts "(y/n)"
   raise_the_bet_computer_options_round_two
 elsif @computer_winning == false
   puts "Alright, let's keep rolling then!"
   roll_three
 else
 end
end

def computer_accept_or_reject_roll_two
 if @computer_rolls > @user_rolls
   @pot = @pot + (@user_raise * 2)
   @wallet = @wallet - @user_raise
   printf("Deal! The pot has been raised by $%.2f, and your balance in now $%.2f.\n", (@user_raise * 2), @wallet)
   roll_three
 elsif @computer_r1 == @computer_r2
   @pot = @pot + (@user_raise * 2)
   @wallet = @wallet - @user_raise
   printf("Deal! The pot has been raised by $%.2f, and your balance in now $%.2f.\n", (@user_raise * 2), @wallet)
   roll_three   
 elsif @computer_r1 % 2 == @computer_r2 % 2 && @user_r1 % 2 != @user_r2 % 2
   @pot = @pot + (@user_raise * 2)
   @wallet = @wallet - @user_raise
   printf("Deal! The pot has been raised by $%.2f, and your balance in now $%.2f.\n", (@user_raise * 2), @wallet)
   roll_three
 else
   @wallet = @wallet + @pot
   printf("I'm pulling out! You won the round!! You won $%.2f, and your new balance is $%.2f! Congratulations!", @pot, @wallet)
   @pot = 0
   menu
 end
end

def raise_the_bet_computer_options_round_two
 user_input = gets.strip.capitalize
 if user_input == 'Y'
   @pot = @pot + 20.00
   @wallet = @wallet - 10.00
   printf("The pot has been increased to $%.2f, and your new balance is $%.2f\n", @pot, @wallet)
   roll_three
 elsif user_input == 'N'
   @wallet = @wallet - @pot
   printf("Ok, good game! Your new balance is $%.2f. I'll see you next time!\n", @wallet)
   menu
 else
   puts "What was that? Enter 'y' for yes or 'n' for no!"
   raise_the_bet_computer_options_round_two
 end
end       

def roll_three
 puts "Ok, let's roll!"
 puts "This is the last turn!"
 puts "Press the Enter key to roll!"
 third_roll_options
end
 
def third_roll_options
 user_input = gets.strip
 if user_input == ''
   @user_r3 = 1 + rand(6)
   @user_rolls = @user_rolls + @user_r3
   puts "Your roll: #{@user_r3}. Roll Total: #{@user_rolls}"
   @computer_r3 = 1 + rand(6)
   @computer_rolls = @computer_rolls + @computer_r3
   puts "My roll: #{@computer_r3}. Roll Total: #{@computer_rolls}"
   win_assessment
 else
   puts "Pfft. The die landed on the floor. Roll again!"
   third_roll_options
 end
end

def all_the_same
 if @user_r1 == @user_r2 && @user_r2 == @user_r3
   @user_all_the_same = true
 else
   @user_all_the_same = false
 end
 if @computer_r1 == @computer_r2 && @computer_r2 == @computer_r3
   @computer_all_the_same = true
 else
   @computer_all_the_same = false
 end
 if @user_all_the_same == true && @computer_all_the_same == true
   @tie_all_the_same = true
 else
   @tie_all_the_same = false
 end
end

def odd_or_even
  @user_r1 = @user_r1.to_f
  @user_r2 = @user_r2.to_f
  @user_r3 = @user_r3.to_f
  @computer_r1 = @computer_r1.to_f
  @computer_r2 = @computer_r2.to_f 
  @computer_r3 = @computer_r3.to_f
 if (@user_r1 % 2) == (@user_r2 % 2) && (@user_r2 % 2) == (@user_r3 % 2)
   @user_odd_or_even = true
 else
   @user_odd_or_even = false
 end
 if @computer_r1 % 2 == @computer_r2 % 2 && @computer_r2 % 2 == @computer_r3 % 2
   @computer_odd_or_even = true
 else
   @computer_odd_or_even = false
 end
 if @user_odd_or_even == true && @computer_odd_or_even == true
   @tie_odd_or_even = true
 else
   @tie_odd_or_even = false
 end
end

def largest_total
 if @user_rolls > @computer_rolls
   @user_largest_total = true
 elsif @user_rolls == @computer_rolls
   @tie_largest_total = true
 else
   @computer_largest_total = true
 end
end

def win_assessment
 all_the_same
 odd_or_even
 largest_total
 if @user_all_the_same == true && @computer_all_the_same == false
  user_win
 elsif @user_all_the_same == true && @computer_all_the_same == true && @user_largest_total == true
  user_win
 elsif @user_odd_or_even == true && @computer_odd_or_even == false && @computer_all_the_same == false
  user_win
 elsif @user_odd_or_even == true && @computer_all_the_same == false && @computer_odd_or_even == true && @user_largest_total == true
  user_win
 elsif @user_largest_total == true && @computer_all_the_same == false && @computer_odd_or_even == false
  user_win
 else
  computer_win_or_tie
 end
end

def user_win
 puts "Congratulations, you've won!!!"
 @wallet = @wallet + @pot
 printf("You won a total of $%.2f, and your new balance is $%.2f. Let's play again soon!!\n", @pot, @wallet)
 @pot = 0
 separator
 menu
end

def computer_win_or_tie
  if @computer_all_the_same == true && @user_all_the_same == false
    user_lose
  elsif @computer_all_the_same == true && @user_all_the_same == true && @computer_largest_total == true
    user_lose
  elsif @computer_odd_or_even == true && @user_odd_or_even == false && @user_all_the_same == false
    user_lose
  elsif @computer_odd_or_even == true && @user_all_the_same == false && @user_odd_or_even == true && @computer_largest_total == true
    user_lose
  elsif @computer_largest_total == true && @user_all_the_same == false && @user_odd_or_even == false
    user_lose
  elsif @computer_rolls == @user_rolls
   tie_breaker
  else
    tie_breaker
  end
end

def user_lose
 puts "Looks like I've one this round, better luck next time!"
 @wallet = @wallet - @pot
 printf("Your new balance is $%.2f. Let's play again soon!\n", @wallet)
 @pot = 0
 separator
 menu
end

def tie_breaker
  puts "We tied! Let's roll to see who wins! Highest number wins."
  puts "Press the Enter key to roll!"
  tie_breaker_options
end
  
 def tie_breaker_options
  user_input = gets.strip
  if user_input == ''
    @user_tie_breaker = 1 + rand(6)
    puts "Your roll: #{@user_tie_breaker}"
    @computer_tie_breaker = 1 + rand(6)
    puts "My roll: #{@computer_tie_breaker}"
    second_tie
  else
    puts "Pfft. The die landed on the floor. Roll again!"
    tie_breaker_options
  end
 end

 def second_tie
  if @user_tie_breaker > @computer_tie_breaker
    user_win
  elsif @user_tie_breaker = @computer_tie_breaker
    tie_breaker
  else
    user_lose
  end
end

