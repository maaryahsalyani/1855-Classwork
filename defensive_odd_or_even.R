# Class 4 Conditionals June 9

# Defensive programming: making sure user does not crash

# if Statement: use it to execute a block of code, if a specified condition is true
# else Statement: use it to execute a block of code, if the same condition is false
# else if Statement: use it to specify a new condition to test, if the first condition is false
# ifelse() Function: use it when to check the condition for every element of a vector

# User input: very imp for interactive scripts: use readline() funciton

# Create a script to let user whether input is odd or even

answer <- readline(prompt = "Please enter a number: ")

# want to make sure the prompt only accepts numbers (not letters, words, strings, etc..)
#answer <- as.numeric(answer) # deleted after adding 69

###adjustments added after line 93: check if answer is numeric
if (is.numeric(as.numeric(answer)) &
    (as.numeric(answer)) %% 1 == 0) {
  #print("Answer is valid") # not tested anymore because we tested
  # } else {
  # print("Entry is not valid. Terminating ...")
  # }
  #here's the thing, if you put as.integer then it would take the 5.2 and convert it it to 5
  # so you add %%1 = 0 because 5 %% 1 = 0 and 5.2 %% 1 = 0.2
  # so now you check if the number is a number and is an integer.
  #press on source (or source it) to run everything

  #however, odd or even only applies to integers so we have to make sure prompt accepts only integers
  answer <- as.integer(answer) # deleted after line 69

  #use curly braces to not limit yourself to one line
  # good programming habit: put closing curly brace after if so you know when to
  # the else starts and R can read it in proper order
  if (answer %% 2 == 0) {
    print("The number is EVEN")
  } else {
    print("The number is ODD")
  } # if-else for result
} else {
  print("Entry is not valid. Terminating...")
} # outer if-else for input validity


# defensive programming: think of the dumbest thing your user can do, and make sure you account for that
# so you should be ready to give warnings or what to correct because you dont
# want your programm to crash by any chace

# so if you put hello to the prompt (being an idiot), you crash your programming
# so add another line of code after readline to check it answer is numeric
# if you select 5.9, then it shows you its odd.
