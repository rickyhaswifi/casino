#UPDATE WALLET TEMPLATE WITH IF/ELSE STATEMENTS - EXAMPLE. COPYPASTA at Line 26
See slots .rb for example
if @wallet <= 11 # Change this to your minumum bet
    puts
    puts "***   NOT ENOUGH FUNDS    ***"
    puts "Win money in other games & come back"
    puts
    menu
elsif #CONDITION
   GameName_win = @wallet * 3 #change variable name to gamename_win then by your multiplier
   puts  "you win $#{sm1_win}!" #display ammount won
    @wallet =  @wallet + sm1_win # add your winnings to the wallet
    puts "New wallet $#{@wallet}" # display new wallet
   slot_machine1
else
    @wallet = @wallet - 10 # subtract cost of bet to wallet
    puts  "You lost $10!"
    puts "New wallet $#{@wallet}" # display new wallet
    slot_machine1 # call method for game
end        

#########################################################
CODE WIH NO COMMENTS & empty slots
#########################################################

if @wallet <= 
    puts
    puts "***   NOT ENOUGH FUNDS    ***"
    puts "Win money in other games & come back"
    puts
    menu
elsif condition
   _win = @wallet * 
   puts  "you win $#{_win}!"
    @wallet =  @wallet + _win
    puts "New wallet $#{@wallet}"
   
else
    @wallet = @wallet - 
    puts  "You lost $!"
    puts "New wallet $#{@wallet}"
    
end        

#########################################################
PRINTING IMAGES - Anything inside EOF puts below, prints as is
#########################################################

puts <<-'EOF'
          
EOF

EXAMPLE -

puts 'You sat down at the slot machine & scared the shit out of a cat'
puts <<-'EOF'
_._     _,-'""`-._
(,-.`._,'(       |\`-/|
    `-.-' \ )-`( , o o)
          `-    \`_`"'-               
EOF