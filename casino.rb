=begin
Start game player has a name and an initial bankroll
Player can go to different games via menu
Slots
High / Low
Player places bet and wins / loses (hint: rand)
Player's bankroll goes up and down with wins and losses

=end



def menu
 puts "1) Play Games"
 puts "2) View Wallet"
 puts "3) Add Money"
 puts "4) Withdraw Money"
 puts "5) See Wins and Losses"
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
else
 puts "Invalid Response, Try Again"
 menu
end

end
def game_menu
 puts "Let's put some games here team!!"
    

 menu
end