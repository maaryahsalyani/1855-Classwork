# Script to identify leap years

#Create a user input map to check if the year is a leap year
# Leap years are divisible by four except for centtury years (years ending with 00); these divisible by 400

year <- readline(prompt = "Please enter a year: ")

# check if year is a century
if (year %% 100 == 0){ # century block

  # century years need to be divisble by 400
  if (year %% 400 == 0) {
    print(paste(year, "is a century and a leap year."))
  } else {
    print(paste(year, "is a century but not a leap year."))
  }
} else { #non-century block

  # non-century years need to be divisible by 4
  if (year %% 4 == 0) {
    print(paste(year, "is not a century but a leap year."))
  } else {
    print(paste(year, "is not a century nor a leap year."))
  }
}


#missing the defensive programming bit where you didnt add the numeric/integer conditions
