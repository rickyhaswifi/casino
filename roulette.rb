

def roulette_lose
    @ro_lose = 50
    @wallet = @wallet - @ro_lose
    puts  "You lost $50!"
    printf("New wallet $%.2f\n", @wallet)

    if @current_guest == nil
        @people[0][:losses] += 1
      else
        @people[@current_guest - 1][:losses] +=1
      end

end

def roulette_win(ro_winpot)
    @wallet = @wallet + ro_winpot
    puts 'You win!'
    printf("New wallet $%.2f\n", @wallet)

    if @current_guest == nil
        @people[0][:wins] += 1
      else
        @people[@current_guest - 1][:wins] += 1
      end

end

def roulette_user_bet
    puts <<-'EOF'
    ____  __  ___    ____   __   ____  ____    ____   __   ____  ____ 
    (  _ \(  )/ __)  (  _ \ /  \ / ___)/ ___)  (  _ \ /  \ / ___)/ ___)
     ) _ ( )(( (_ \   ) _ ((  O )\___ \\___ \   )   /(  O )\___ \\___ \
    (____/(__)\___/  (____/ \__/ (____/(____/  (__\_) \__/ (____/(____/              
    EOF
    puts
    puts "How would you like to bet tonight - minimum play is $50"
    puts "type 0, even, odd or a single digit from 1-36 to win bigger"
    puts "You can also bet 1-12, 13-24, 25-36, red, black"
    puts "A 0 bet pays the most"
    puts "type \'n\' to return to the casino"
    print "enter bet:"
    @roulette_bet = gets.strip
    spin
end

def spin
    dealer_message = ["This is my summer internship to wheel of fortune - Ross The Dealer", "My boss says I shouldn\'t let you win - Ross The Dealer", "Good to see you again, must be payday - Ross The Dealer", "Thank you the casino donation...I mean bet - Ross The Dealer", "They said we couldn\'t setup a casino in Utah, yet here you are - Ross The Dealer", "Hi ya there friend my name is Jerry filling in, Ross the Boss is at the buffet"]
    # wheel_array = ['00', 0, *1..36]
    wheel_array = [*0..36]
    @ball_land = wheel_array.sample
    puts
    puts "#{dealer_message.sample}"
    puts
    puts "*The dealer spun the wheel"
    sleep (0.5)
    puts "Takata Takata Takata Takata *ball slows down"
    sleep (0.5)
    puts "The ball landed on #{@ball_land}"
    puts
    bet_result
end

def bet_result
    # @e = @ball_land % 2 == 0
    # @e = (2..36).step(2)

    if @wallet <= 51
        puts
        puts "***   NOT ENOUGH FUNDS    ***"
        puts "Win money in other games & come back"
        puts
        menu

    elsif @roulette_bet == 'n'
        puts "You returned to the casino"
        menu

    elsif @roulette_bet == 0
        roulette_win(1000)
        roulette_user_bet

    elsif @roulette_bet == @ball_land
        roulette_win(500)
        roulette_user_bet

    elsif @roulette_bet == '1-12'
        if @ball_land <= 12
        roulette_win(100)
        roulette_user_bet
        else @ball_land >= 13
        roulette_lose
        roulette_user_bet    
        end  

    elsif @roulette_bet == '13-24'       
        if @ball_land == [*13..24]
        roulette_win(100)
        roulette_user_bet
        else @ball_land != [*13..24]
        roulette_lose
        roulette_user_bet
        end  

    elsif @roulette_bet == '15-36'       
        if @ball_land >= 15
            roulette_win(100)
            roulette_user_bet
            else @ball_land >= 14
            roulette_lose
            roulette_user_bet    
            end  

    elsif @roulette_bet == 'even'
        ball_land = @ball_land
        if ball_land.to_i.even?  
        roulette_win(100)
        else ball_land.to_i.odd?  
        roulette_lose
        end
        roulette_user_bet

    elsif @roulette_bet == 'odd'
        ball_land = @ball_land
        if ball_land.to_i.odd?  
        roulette_win(100)
        else ball_land.to_i.even?  
        roulette_lose
        end
        roulette_user_bet 

    elsif @roulette_bet == 'black'
        ball_land = @ball_land
        if ball_land.to_i.even?  
        roulette_win(100)
        else ball_land.to_i.odd?  
        roulette_lose
        end
        roulette_user_bet

    elsif @roulette_bet == 'red'
        ball_land = @ball_land
        if ball_land.to_i.even?
        roulette_lose  
        else ball_land.to_i.odd?  
        roulette_win(100)
        end
        roulette_user_bet
        
    else @roulette_bet != @ball_land
        roulette_lose  
        roulette_user_bet  


    end    
end 

# class Roulette - Testing W/O class for wallet function
#     def initialize
#         roulette_user_bet
#     end
# end
