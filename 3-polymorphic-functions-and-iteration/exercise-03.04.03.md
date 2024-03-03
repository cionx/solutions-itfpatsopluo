# Exercise 3.4.3

> Explain why the following functions are primality tests:  
>
> a) $\lambda x. x \geq 2 \mathbin{\mathtt{\&\&}} \mathit{first} \; (\lambda k. x \mathbin{\%} k = 0) \; 2 = x$  
> b) $\lambda x. x \geq 2 \mathbin{\mathtt{\&\&}} (\mathit{first} \; (\lambda k. k^2 \geq x \mathbin{||} x \mathbin{\%} k = 0) \; 2)^2 > x$
>
> Hint for (b):
> Let $k$ be the number the application of $\mathit{first}$ yields.
> Distinguish three cases: $k^2 < x$, $k^2 = x$, and $k^2 > x$.

---



### a)

A number $p$ is prime if and only if

1. $p \geq 2$, and
2. the only divisors of $p$ are $1$ and $p$ itself.

The second condition can be rephrased:

3. the first divisor of $p$ strictly larger than $1$ is $p$ itself.

The expression $\mathit{first} \; (\lambda k. x \mathbin{\%} k = 0) \; 2$ is the first divisor of $p$ strictly larger than $1$.
The proposed function therefore checks for conditions 1 and 3.



### b)

Let $x \geq 2$.
We denote the number $\mathit{first} \; (\lambda k. k^2 \geq x \mathbin{||} x \mathbin{\%} k = 0) \; 2$ by $n$.
The number $n$ is minimal number with $n \geq 2$ such that

1. $n^2 \geq x$, or
2. $n$ is a divisor of $x$.

We now distinguish between three cases:

##### Case 1: $n^2 < x$

If $n^2 < x$ then $n$ must be a divisor of $n$.
It follows from $n \leq n^2 < x$ that $n$ is a proper divisor of $x$.
We also know that $n \geq 2$.
We have thus found a proper divisor of $x$ different from $1$, which tells us that $x$ is not prime.

The test $n^2 > x$ fails, so we get the correct result.

##### Case 2: $n^2 = x$.

That $n^2 = x$ tells us that $n$ is a proper divisor of $x$ different from $1$, because $x \geq 1$.
Therefore, $x$ is not prime.

The test $n^2 > x$ fails, so we get the correct result.

##### Case 3: $n^2 > x$

The minimal divisor $d$ of $x$ with $d \geq 2$ satisfies $d \geq n > \sqrt[2]{x}$.
This tells us that $x$ is prime.

The test $n^2 > x$ succeeds, so we get the correct result.
