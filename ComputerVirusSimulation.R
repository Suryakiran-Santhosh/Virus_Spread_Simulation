"
ECS 132: Probability and Statistical Modeling for Computer Science
By: Suryakiran Santhosh
University of California Davis Winter 2021
Homework #1 Problem 4 (Computer Virus Simulation)
"
 

simvir <- function(c, r, m, n, nreps){
    total <- 0 # Total is number of cases where you have n infected computers by epoch m.
    
    # A vector of length c filled with all False values, where FALSE represents uninfected compute
    computerArr <- seq(FALSE,FALSE,length.out=c)

    for (trial in 1:nreps){
        k <- 0 # No infected computers initially
    
        computerArr[computerArr == TRUE] <- FALSE # Reset all TRUE values back to FALSE

        for (epoch in 1:m){
            if (epoch == 1){
                computerArr[1] <- TRUE
                k <- 1
            }
            
            # The probability of a event occuring must be between 0 to 1 (0% to 100%)
            probability <- r ** k

            # Create a vector of length c with values between 0 and 1.
            # 0 represents 0%
            # 1 represents 100%
            infectedProbabilityArr <- runif(c,0,1)
            
            # For each computer, if the individual infected probability > probability and were previously uninfected, set them to TRUE(infected)
            computerArr[infectedProbabilityArr > probability & computerArr == FALSE] <- TRUE

            # Update k based on how many infected computers there are
            k <- sum(computerArr ==  TRUE)
            
            # k represents number of infected computers
            # c-k represents number of uninfected computers
            if (c-k == n){
                total <- total + 1
            }
        }           
    }
    return(total/nreps)
}


main <- function(){
    print(simvir(20, 0.5, 2, 5, 10000))
    print(simvir(20, 0.5, 2, 8, 10000))
}


main()