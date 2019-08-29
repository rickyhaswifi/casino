# require_relative 'outside'
def random_event_1
    sleep(2) #
    puts
    puts
    puts "Tupac got in a fight in the lobby"
    puts "You find $500 on the ground"
    @wallet = @wallet + 500
    printf("New wallet $%.2f\n", @wallet)
    puts
    puts
    menu #returns to menu
    end

    def random_event_2
        sleep(2)
        puts
        puts
        puts "You found car keys"
        puts "Go outside the casino then visit the garage to see your new car"
        @mystery_car = {car: 'Ferrari', model: '488 GTB', year: 1994}
        @garage << @mystery_car
        puts
        puts
        menu 
        end    