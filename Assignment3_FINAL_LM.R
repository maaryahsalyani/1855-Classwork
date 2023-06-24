### Leen Madani | Assignment 3
### The version of R used: 4.0.3


# Set the working directory using setwd() command to access required files.
setwd("C:/Users/leenm/Documents/1855-Assignments")

#' Read and load custom dictionary from "dictionary.txt" using readLines() function
#' readLines is used as opposed to read.table or read.csv because no need for data to be stored as data frame since my data is unstructured.
#' readLines() will do its job in reading rile as character vector.
#  Store data from dictionary as variable called "dctn".
dctn <- readLines("dictionary.txt")


# Function to start the game
start_game <- function() {
  # Choose a random element from dictionary using the sample(), and indicate you only need 1 element.
  secret_word <- sample(dctn, 1)

  # Splits the secret_word string into individual letters using strsplit() function and stores them in the vector secret_letters
  secret_letters <- strsplit(secret_word, "")[[1]] # the "" used as a separator which would split the secret word at each empty position, or each letter in this case.

  # Create a variable called guessed_letters which has the same length of secret letters but represented with an underscore.
  guessed_letters <- rep("_", length(secret_letters))

  # set the number of remaining guesses
  remaining_guesses <- 7


  # Return the game state as a list in order for game state to be used as an input for other functions like display_game_state() and process_guess()
  list(secret_word = secret_word,
       secret_letters = secret_letters,
       guessed_letters = guessed_letters,
       remaining_guesses = remaining_guesses)
}

# Function to display the current game state
display_game_state <- function(game_state) { # i want to pass values into the display_game_state function, so include the game_state argument.
  print(paste("Secret word: ", paste(game_state$guessed_letters, collapse = " "))) #inform user of length of secret word; collapse = " " ensures that each underscore is separated by a space.
  print(paste("Remaining guesses: ", game_state$remaining_guesses )) # inform user of number of wrong guesses/tries allowed.
}

# Function to process a player's guess (if guess is valid, correct, wrong, etc..)
process_guess <- function(game_state, guess) {
  secret_letters <- game_state$secret_letters
  guessed_letters <- game_state$guessed_letters
  remaining_guesses <- game_state$remaining_guesses

  # Ensure the guess is a single letter
  if (nchar(guess) != 1 || !grepl("[a-zA-Z]", guess)) {  # if i put is.numeric(guess) == TRUE, the  condition will always be false because readline() treats all inputs as character strings, including numeric inputs.
    print("Invalid entry! Please enter a single letter.") # therefore, i used !grepl("[a-zA-Z]", guess) to make the "guess" is a letter in the alphabet
    return(game_state)  # return to the the unchanged game state
  }

  guess <- tolower(guess)  # convert the guess to lowercase to make the game more user friendly
  # this way, user can still put a upper casel letter and if it is in the word, it will be considered correct.

  # Check if the guess has already been made
  if (guess %in% guessed_letters) {
    print("You have already guessed that letter.")
    return(game_state)  # return the unchanged game state
  }

  # Check if guess, which is the user input, is found in the secret word.
  if (guess %in% secret_letters) {

    guessed_letters[secret_letters == guess] <- guess # if yes, replace the corresponding dashes with the correct letter and print "Correct guess".
    print("Correct guess!")
  } else { #else let user know its a wrong guess and subtract from remaining tries
    print("Wrong guess!")
    remaining_guesses <- remaining_guesses - 1

    # Provide user with hint for each word in the dictionary when 3 tries are left.
    if (remaining_guesses == 3) {
      if (game_state$secret_word == "istanbul") {
        print("Hint: Formerly known as Constantinople and often mistaken as the country's capital city.")
      } else if (game_state$secret_word == "dubai") {
        print("Hint: Has the tallest building in the world.")
      } else if (game_state$secret_word == "paris") {
        print("Hint: Known as the 'City of Love'.")
      } else if (game_state$secret_word == "cairo") {
        print("Hint: Home to the Pyramids of Giza.")
      } else if (game_state$secret_word == "vancouver") {
        print("Hint: Coastal city in Canada known for its scenic beauty.")
      } else if (game_state$secret_word == "rome") {
        print("Hint: Home to the Colosseum.")
      } else if (game_state$secret_word == "london") {
        print("Hint: Canada has the same city name.")
      } else if (game_state$secret_word == "seoul") {
        print("Hint: Global hub for tech, K-pop.")
      } else if (game_state$secret_word == "tokyo") {
        print("Hint: Capital of Japan.")
      } else if (game_state$secret_word == "damascus") {
        print("Hint: Capital of Syria.")
      }
    }
  }

  # Update the game state variable with the new values after processing the user's guess.
  updated_game_state <- list(secret_word = game_state$secret_word, # ensures secret_word is intact
                             secret_letters = secret_letters,
                             guessed_letters = guessed_letters,
                             remaining_guesses = remaining_guesses)

  return(updated_game_state)
}


# Main game loop script

print(paste("Welcome to Hangman -GUESS THE CITY- Game:"))
Sys.sleep(1) # this will give a 1 second pause before the rest of the prompt is shown.

play_hangman <- function() {
  # Start the game
  game_state <- start_game()

  # Ensure user does not enter a numeric, NA or two letters
  while (game_state$remaining_guesses > 0) {
    display_game_state(game_state)

    # Get player's guess
    guess <- readline("Enter your guess: ")

    # Process the guess
    game_state <- process_guess(game_state, guess)

    # Check if the game has been won
    if (identical(game_state$secret_letters, game_state$guessed_letters)) {
      print(paste("Congratulations! You won! The city is:", game_state$secret_word))
      break
    }

    # Check if the game is lost
    if (game_state$remaining_guesses == 0) {
      print(paste("Game over... The city was: ", game_state$secret_word))
      break
    }
  }
}
# Let the game begin!
play_hangman()


#'REVIEW
#'Great job setting up the display of the game with messages that introduce the game, show the total and remaining guesses, and dashes for the length of the word
#'Very detailed comments made for each of your codes 
#'Really like the hints that you provided for each city, very creative way to use elseif statements
#'Next time may be helpful to store the hints in a separate data structure (like list or data frame) rather than using a series of if statements as it will enhance the simplicity when reading the code
#'The code converts all guesses to lowercase which is preventing the user from guessing the correct word despite being the correct letter. Double check that it is senstive to capital letters
#'The code successfully detects invalid entries (numbers and symbols)
#'I noticed you have a code that checks if the guess has already been made-maybe double check the code as it did not display a message when I repeated the wrong letter twice




