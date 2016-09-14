require 'pry'
require_relative "deck"
require_relative "hand"

deck = Deck.new
player = Hand.new(deck.deal(2))
dealer = Hand.new(deck.deal(2))

player_display = player.display_hand
dealer_display = dealer.display_hand

player_score = player.score
dealer_score = dealer.score

# this stuff happens just once
def start_game
  puts "Hello player, what is your name?"
  player_name = gets.chomp

  puts "Hello #{player_name}, are you ready for a game of Blackjack?(y/n)"
  start_game = gets.chomp

  if start_game == "y".downcase
    puts "#{player_name} and dealer have been dealt their cards"
  else
    puts "Okay, goodbye."
  end
end


def rest_of_game
  # show dealt cards and calculate current score
  puts "You have been dealt: #{player_display}"
  puts "Your current score is #{player_score}"

  # checking for player blackjack - end game
  # write this as a separate method using case statements
  if player.blackjack? && !dealer.blackjack?
    puts "Blackjack! You win #{player_name}"
  elsif dealer.blackjack? && !player.blackjack?
    puts "Would like to hit or stand?(h/s)"
    player_hit = gets.chomp

    # let's not worry about invalid inputs for now
    # we can build an "error handler" later
    while player_hit == "h"
      # tell them they hit
      puts "You have selected 'hit'"

      # show cards in updated hand
      puts "You have been dealt: #{hit_display}"

      # check updated player score
      if total_player_score > 21
        puts "You busted with a score of #{total_player_score}, the game has ended"
      else
        puts "Your new score is #{total_player_score}"

        # this is where we loop back
        # let's think about how to pull these out
        puts "Would like to hit or stand?(h/s)"
        player_hit = gets.chomp
      end

    end

    if player_hit == "s"
      puts "You have selected 'stand'"
    else
      puts "You have made an invalid selection, goodbye"
    end
  end
end


def game_runner
  start_game
  # check blackjack (method)
  # if not blackjack, proceed with game (method)
    # handle user input
    # hit/stand/score
    # once stand, go to dealer
  #
end

# who is the winner

# binding.pry
