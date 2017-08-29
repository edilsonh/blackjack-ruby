require_relative "lib/game"

game = Game.new
puts "\nWelcome to BlackJack, Lets play!\n\n"


while game.user.money > 0

  puts "\nYou have $#{game.user.money}. You will now bet $10\n\n"
  game.shuffle_deck
  2.times{game.dealer_draw}
  2.times{game.user_draw}
  game.user.bet

  while true
    puts "Your current hand is:"
    game.current_hand(game.user)
    puts "Your hand total is #{game.hand_total} \n\n"
    user_total = game.hand_total
    if game.hand_total > 21
      puts "You went over 21. Dealer Wins, You Lose!"
      break
    elsif game.hand_total == 21
      puts "BLACKJACK! YOU WIN!!!"
      game.user.win
      break
    elsif game.hand_total < 21
      puts "Would you like to hit or stand?"
      puts "Type h for hit. Type s for stand."
      response = gets.chomp.downcase
      if response == "h"
        puts "\nOk, now drawing card..."
        game.user_draw
      elsif response == "s"
        puts "\nPlaying it safe!\n"
        while true
          puts "\nDealer's current hand is:"
          game.current_hand(game.dealer)
          puts "Dealer's hand total is #{game.hand_total}\n\n"
          if game.hand_total < 16
            game.dealer_draw
            puts "Dealer draws a card"
          elsif game.hand_total > 21
            puts "Dealer broke, You Win!"
            game.user.win
            break
          elsif game.hand_total == 21
            puts "Dealer Wins!"
            break
          elsif game.hand_total > 16 && game.hand_total < 21
            puts "Dealer Stands..."
            if user_total > game.hand_total
              game.user.win
              puts "You're closer to 21, you win!"
              break
            elsif user_total < game.hand_total
              puts "Dealer is closer to 21, you lose!"
              break
            else
              puts "Tied, here's your money back."
              game.user.tie
              break
            end
            break
          end
        end
        break
      else
        puts "\nInvalid Response, Try Again...\n\n"
      end
    end
  end


  while true
    if game.user.money < 10
      puts "\nLooks like you don't have enough money, come back when you do...\n\n"
      exit
    end
    puts "\nWould you like to play again?"
    puts "Type y for yes. Type n for no"
    play_again = gets.chomp.downcase
    if play_again == "n"
      puts "\nThanks for Playing!\n"
      exit
    elsif play_again == "y"
      puts "\n\nWelcome Back!\n"
      game.user.hand.clear
      game.dealer.hand.clear
      break
    else
      puts "\nInvalid Response, Try Again..."
    end
  end
end
