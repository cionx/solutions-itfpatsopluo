# Exercise 3.4.3

Explain why the following functions are primality tests:  

1. `λ x. x >= 2 && first (λ k. x % k = 0) 2 = x`
2. `λ x. x >= 2 && (first (λ k. k^2 >= x || x % k = 0))^2 > x`

Hint for (2):
Let `k` be the number the application of `first` yields.
Distinguish three cases: `k^2 < x`, `k^2 = x`, and `k^2 > x`.

---



### 1.

A number `p` is prime if and only if

1. `p >= 2`, and
2. the only divisors of `p` are `1` and `p` itself.

The second condition can be rephrased:

3. the first divisor of `p` strictly larger than `1` is `p` itself.

The expression `first (λ k. x % k = 0) 2` is the first divisor of `p` strictly larger than `1`.
The proposed function therefore checks for conditions 1 and 3.



### 2.

Let `x >= 2`.
We denote the number `first (λ k. k^2 >= x || x % k = 0) 2` by `n`.
The number `n` is minimal number with `n >= 2` such that

1. `n^2 >= x`, or
2. `n` is a divisor of `x`.

We now distinguish between three cases:

##### Case 1: `n^2 < x`

If `n^2 < x` then `n` must be a divisor of `n`.
It follows from `n <= n^2 < x` that `n` is a proper divisor of `x`.
We also know that `n >= 2`.
We have thus found a proper divisor of `x` different from `1`, which tells us that `x` is not prime.

The test `n^2 > x` fails, so we get the correct result.

##### Case 2: `n^2 = x`.

That `n^2 = x` tells us that `n` is a proper divisor of `x` different from `1`, because `x >= 1`.
Therefore, `x` is not prime.

The test `n^2 > x` fails, so we get the correct result.

##### Case 3: `n^2 > x`

The minimal divisor `d` of `x` with `d >= 2` satisfies `d >= n > √x`.
This tells us that `x` is prime.

The test `n^2 > x` succeeds, so we get the correct result.
