from primes.primelist import PrimesList
import math


def odd_composites_list(num: int):

    if num % 2 == 0:
        num = num + 3
    else:
        num = num + 2

    primes = set(PrimesList(num).list)
    odds = {(2*j + 1) for j in range(math.floor(num/2))}
    odd_comps = sorted(list(odds - primes))
    return odd_comps, sorted(list(primes))

def is_square(num:int):
    if int(math.floor(math.sqrt(num))**2) == num:
        return True
    else:
        return False


def goldbach(num: int, primeslist: list):
    plist = [j for j in primeslist if j <= num]

    found = False
    k = 0
    for p in plist:
        z = int((num - p)/2)
        if is_square(z):
            found = True
            return found

    return found


if __name__ == "__main__":
    upper_bound = 6000
    odds, primes = odd_composites_list(upper_bound)
    for w in odds:
        if not goldbach(w, primes):
            print(w)
