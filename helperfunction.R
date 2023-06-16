# Helper function June 16, 2023

# name and definition of the function
get_user_input_int <- function() {
  repeat {
    answer <- readline(prompt = "Please enter an integer:")
    if(!is.na(as.numeric(answer)) &
       (as.numeric(answer)) %% 1 ==0) {
      break
    } #if
  } #repeat
  answer <- as.integer(answer)
  return(answer)
}


# Fn to accept one character only

get_user_input_char <- function() {
  repeat {
    answer <- readline(prompt = "Please enter a character:")
    if(nchar(answer) ==1 ) {
      break
      }#if
    } #repeat
    return(answer)
}

View(get_user_input_int())
View(get_user_input_char())



# how to load the functions in memory? use the source function with the file name.


#Instead of having the function name as get_user_input_char and trying to remember the funtion name
# like what we had above for entering a character , you can have this simply get user input and specify that type inside is character
# This is much more flexible: ask user for input, and set the expectation for the user.
get_user_input <- function(input.type = "char") {
  repeat {
    answer <- readline(prompt = "Please enter a character:")
    if(nchar(answer) ==1 ) {
      break
    }#if
  } #repeat
  return(answer)
}

get_user_input()


