---
course: >-
  Ruby on Rails
title: >-
  Blackjack
description: >-
  Create a command-line game that allows one player to play blackjack against the computer.
---

For this weekly assignment, you will create a one-player-against-the-computer game of blackjack. You will take your notes from your "Designing classes for blackjack" activity to use in writing the classes and other code for this game.

The following restrictions apply to your game:

* The game should start the player with $100 and bets are $10.
* The only valid moves are hit and stand.
* Allow the player to keep playing as long as they have money.
* The dealer uses one deck in their shoe and reshuffles after each round.

Traditionally in blackjack, the dealer has one card visible. Implementing this can be considered optional.

### Getting user input

One thing you will have to do in this project that you have not before is get user input from the command line. In Ruby, the [`gets` method](https://ruby-doc.org/core-2.4.1/Kernel.html#method-i-gets) will let you do this. An example:

```irb
irb(main):001:0> name = gets
Keelan
=> "Keelan\n"
irb(main):002:0> name
=> "Keelan\n"
irb(main):003:0> name.chomp
=> "Keelan"
```

`.chomp` removes a final newline from a string if there is one. You will need this when getting input from users. One more example, this time of a function that handles getting a yes or no from a user:

```ruby
def get_yes_or_no
  # loop until you get a good answer and return
  while true
    print "Please enter (y)es or (n)o: "
    answer = gets.chomp.downcase
    if answer[0] == "y"
      return true
    elsif answer[0] == "n"
      return false
    end
    puts "That is not a valid answer!"
  end
end
```

### Sample transcript

Here is a sample transcript of game play. It ends after three rounds for brevity, but would continue in actual play.
Your game does not have to have the same text, but play will be similar.

```
Hello and welcome to the game of blackjack! Let's begin.

You have $100 and bet $10.
You have a 9 and a 8 in your hand. Your total is 15.
Do you want to (h)it or (s)tand? H

You hit. You now have a 9, 8, and 4 in your hand. Your total is 19.
Do you want to (h)it or (s)tand? S

You stand. Your total is 19.

The dealer hits.
The dealer stands. The dealer has a total of 20. You lose!

---

You have $90 and bet $10.
You have an A and a 7 in your hand. Your total is 18.
Do you want to (h)it or (s)tand? H

You hit. You now have an A, 7, and 9 in your hand. Your total is 17.
Do you want to (h)it or (s)tand? H

You hit. You now have an A, 7, 9, and 5 in your hand. Your total is 22.
You bust!

---

You have $80 and bet $10.
You have a 5 and a 5 in your hand. Your total is 10.
Do you want to (h)it or (s)tand? H

You hit. You now have a 5, 5, and A in your hand. Your total is 21.

The dealer stands. The dealer has a total of 19. You win!

---

You have $90 and bet $10.
...
```

# Files

Starter files have been provided in the 'starter\_files' folder. There is only a set of directories, a `Rakefile`, and a `blackjack.rb` file which should be run to start your game. No tests are provided, but you should write tests to help you along the way.

[callout-download]
[/callout-download]
