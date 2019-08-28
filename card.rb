require_relative 'deck'


class Card
  # Getter and Setter methods for rank, suit and color
  attr_accessor :rank, :suit, :color
  # Gets called when you call the new method to create an instance
  # card = Card.new('10', 'Spades', 'Black')
  def initialize(rank, suit, color)
    @rank = rank
    @suit = suit
    @color = color
  end
 end

# @suit = ['Spades', 'Hearts', 'Diamonds', 'Clubs']
# @color = ['Red', 'Black']
# @rank = ['A', '1', '2', '3', '4', '5', '6', '7', '8', '9']
# @random_rank = @rank.shuffle.first
# puts @random_rank
# @random_suit = @suit.shuffle.first
# puts @random_suit
# case @random_suit
# when 'Spades'
#   @random_color = 'Black'
# when 'Hearts'
#   @random_color = 'Red'
# when 'Diamonds'
#   @random_color = 'Red'
# when 'Clubs'
#   @random_color = 'Black'
# else
# end
# puts @random_color

