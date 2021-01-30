# Virus_Spread_Simulation

This problem is adapted from CS research on computer viruses. But it will also give you a glimpse into the various epidemiology models of Covid-19.

Characteristics: 

        1.) We have c computers.
        2.) Time is slotted. Let Xi denote the number of infected computers at the beginning of epoch i.
        3.) In the beginning, Time 0, one of the computers is infected with a virus.
        4.) Halfway through any epoch, each infected computer may infect each of the noninfected computers. If there are currently k infected computers, any given noninfected one will stay noninfected with probability rk, independently.

Write a simulation function with call form:

          simvir(c,r,m,n,nreps) 

that will return the approximate probability that there are n noninfected computers at the start of epoch m.

To help guide your thinking (and to serve as a check on your simulation code), let's work out a small case analytically (i.e. math analysis):
  
    m = 1 and c = 3. 
    During epoch 0, which ends at time 1, the one infected machine will try to infect the two noninfected machines, which we'll     name u and v. 
    So X1 = 1 means that either u becomes infected and v doesn't, or vice versa. The probability of this is
    2(1-r1) r1


As another example, consider P(X2 = 3 | X1 = 2), for general c ≥ 3. For some conditional probabilities, for instance, we need to employ intuition, which is the case here.

    How can X2 = 3? 
    We have c-2 noninfected machines, and exactly 1 would then become infected. Our probability is: 
    (c-2) (1 - r2) [r2)]c-3

To see this, name the noninfected machines 1,2,3,...,c-2. What is the probability that machine 1 will become infected and the others don't. The probability of machine 1 becoming infected is 1-r2, and each of the other (c-2)-1 = c-3 noninfected machines will stay noninfected with probability r2. So, the probability that machine 1 will become infected and the others don't is

    (1-r2) x r2 x r2 x ... x r2

where there are c-3 factors of r2.
But that's just for machine 1. We have the same expression for machines 2, 3, ...,c-2. Thus the above must be multiplied by c-2.
