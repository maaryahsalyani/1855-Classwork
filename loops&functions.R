# Class 4 Loops and Functions June 16, 2023

for(i in seq) {
  #do stuff i = "a"
}

seq <- c(1:100)

alph <- letters

alph

for (i in seq) { #this for loop will run for each element in the sequence (in this case, 100 times)
    print (i)
  }# i takes the value of the element (in this case, first element is 1)


#using an array index
my_seq2 <- c("a", "b", "c", "d", "e")
for (i in seq_along(my_seq2)) {
  print (i)
} # seq_along () takes an array and replaces it with a sequence number series aka element index


#using an array index another way
for (i in 1:length(my_seq2)) {
  print(i)
}

#what if you don't put 1:length and just length? gives you the total number of elements
for (i in length(my_seq2)) {
  print(i)
}






#if you really know and cannot control number of iterations, you may need a diff type of loop.
# use a "while" loop

while (cond) {
  expr
}   ###BEWARE OF INFINITE LOOPS


#instead of going through a for loop and trying to break the loop in the middle, i can say:
my_seq <- c(1,2,3,4,5)

i <- 1 # initialize the sequence
       # in for loop, we do "i in my_seq" and it automatically assigns i to the elements in sequence
       #in other loops, we have to make the assingment ourselves and decrease and increase it on our own.


while (my_seq[i] <= 3) {
  print(i)
  #i <- i+1    # if you remove this, you will go through an infinite loop
}


# "repeat" loop: you should specify when you want to break the loop.
# you need an if statement inside the loop; whereas in while, we specifiy it but it auto does the if.

repeat {
  expr
  break
}   ## BEWARE OF INFINITE LOOPS


repeat {
  print (i)
  } #how to break out of loop?

repeat {
  print (i)
  break
} # you don't really need a repeat command in this case because the print() function does it very well

repeat {
  print (i)
  if (i < 3){
    i <- i+1
  } else {
    break
  }
}


# in repeat loop, you literally have to specify every little thing
repeat {
  print (i)
  # break condition needs to be checked inside the
  if (i < 30){
    i <- i+1
  } else {
    break
  }
}

# try to check for an integer and numeric using loops (struggled in previous class)

#' repeat loop:
#' ask for inpit
#' if not proper loop
#' if proper break


#' while loop:
#' ask for input
#' start loop checking if proper
#' if not proper ask again and loop


# LETS TRY REPEAT LOOP

#repeatedly ask if the user entered something inproper, then go back and ask again.
# if user answers something proper, then go ahead to next line.
repeat {
  answer <- readline(prompt = "Please enter number:")
  if(!is.na(as.numeric(answer)) &
     (as.numeric(answer)) %% 1 ==0) {
       break
     } #if
} #repeat

# to create your own function or user defined functions (not found in any package in R):
function(arglist) {
  body
  return(value)
}

sum(my_seq)

my_fun <- function(a){a*2}
my_fun(4)


my_1st_fun <- function () {
  print("Hello world!")
}

my_2nd_fun <- function(x) {
  print(paste("The square of", x, "is", x**2))
}

my_3rd_fun <- function(x=1) {
  x_sqr <- x**2
  return(x_sqr)
}

my_1st_fun()
my_2nd_fun() #gives error because we just said x without any value
my_2nd_fun(2)
my_3rd_fun() #here we have some sort of default value because we said x=1
my_3rd_fun(3)


