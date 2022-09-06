puts "welcooome to 'best game ever.'"

puts "what is youe name? "
name = gets
name = name.chomp
puts "Welcome, #{name}!"

puts "i've got a random number beetwen 1 and 100.\nCan you guess it?"
target = rand(5) + 1
count_guesses = 0
ended = false
maxim = 5
until count_guesses == maxim || ended
    puts "you've got #{maxim - count_guesses} guesses left."
    print "make a guess: "
    guess = gets.to_i

    count_guesses += 1

    if guess < target 
        puts "ooops, your guess was low."
    elsif guess > target
        puts "oops, your gets was high."
    else
        puts "eee, good job #{name}!\nyour guessed number in #{count_guesses} guesses!"
        ended = true
    end
end

if ! ended
    puts "sorry, you're loser. (it was #{target})"
end
