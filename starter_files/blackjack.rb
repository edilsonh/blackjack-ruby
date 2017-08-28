require_relative "lib/game"

game = Game.new
puts "\nWelcome to BlackJack, Lets play!\n\n"


while game.user.money > 0

  puts "\nYou have $#{game.user.money}. You will now bet $10\n\n"
  game.shuffle_deck
  2.times{game.dealer_draw}
  2.times{game.user_draw}
  game.user.bet

  while game.user.money > 0

    game.current_hand

    puts "Your hand total is #{game.hand_total} \n\n"
    if game.hand_total > 21
      puts "You went over 21, You lost!"
      break
    elsif game.hand_total == 21
      puts "BLACKJACK! YOU WIN!!!"
      game.user.win
      break
    end
    puts "Would you like to hit or stand?"
    puts "Type h for hit. Type s for stand."
    response = gets.chomp.downcase
    if response == "h"
      puts "Ok, now drawing card..."
      game.user_draw
    elsif response == "s"
      puts "playing it safe"
      break
    else
      puts "Invalid Response, Try Again"
    end

  end

  puts "\nWould you like to play again?"
  puts "Type y for yes. Type n for no"
  play_again = gets.chomp.downcase
  if play_again == "n"
    puts "\nThanks for Playing!\n"
    break
  elsif play_again == "y"
    puts "\n\nWelcome Back!\n"
    game.user.hand.clear
  end

end
