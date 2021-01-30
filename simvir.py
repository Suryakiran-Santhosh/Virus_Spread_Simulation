"""
ECS 132: Probability and Statistical Modeling for Computer Science
By: Suryakiran Santhosh and Stephen Wong
University of California Davis
Winter 2021
"""


import random


def simvir(c: int, r: float, m: int, n: int, nreps: int) -> float:
    """
    r - numerical argument affecting how likely computer will remain uninfected
    c - number of computers
    Find probability of n uninfected computers at start of epoch m
    Each computer all equally have chance of r^k
    """

    total = 0  # Total is just for calculating the probability
    for trial in range(nreps):
        k = 0  # No infected computers initially
        computerArr = [0] * c  # 0 represents no computers infected

        # Should be m - 1? Since we are looking at the start of epoch m
        for epoch in range(m-1):
            if epoch == 0:
                # One computer is infected at beginning of epoch 0
                computerArr[0] = 1
                k = 1

            probability = r ** k

            for idx in range(len(computerArr)):
                result = random.uniform(0, 1)
                if(result > probability) and (computerArr[idx] == 0):
                    computerArr[idx] = 1
                    k += 1

        if (c-k) == n:
            total += 1

    return (total/nreps)


print(simvir(20, 0.5, 2, 5, 1000))
print(simvir(20, 0.5, 2, 3, 1000))
