# Exercise 1.9.3 (Sum functions)

> a) Define a function $\mathbb{N} \to \mathbb{N}$ computing the sum $0 + 1 + 2 + \dotsb + n$ of the first $n$ numbers.  
> b) Define a function $\mathbb{N \to N}$ computing the sum $0 + 1^2 + 2^2 + \dotsb + n^2$ of the first $n$ square numbers.  
> c) Define a function $\mathit{sum} \colon (\mathbb{N} \to \mathbb{N}) \to \mathbb{N} \to \mathbb{N}$ computing for a given function $f$ the sum $f(0) + f(1) + f(2) + \dotsb + f(n)$.  
> d) Give partial applications of the function sum from c) providing specialized sum functions as asked for by a) and b).

---

### a)

We can define this function as
$$
  s_1 \; n
  \coloneqq
  \begin{cases}
    0                & \text{if $n = 0$,} \\
    n + f \; (n - 1) & \text{if $n > 0$.}
  \end{cases}
$$

### b)

We can define this function as
$$
  s_2 \; n
  \coloneqq
  \begin{cases}
    0                  & \text{if $n = 0$,} \\
    n^2 + f \; (n - 1) & \text{if $n > 0$.}
  \end{cases}
$$

### c)
We can define this function as
$$
  \mathit{sum} \; f \; n
  \coloneqq
  \begin{cases}
    f \; 0                                & \text{if $n = 0$,} \\
    f \; n + \mathit{sum} \; f \; (n - 1) & \text{if $n > 0$.}
  \end{cases}
$$

### d)

We can express the functions $s_1$ and $s_2$ in terms of $\mathit{sum}$ as
$$
  s_1 = \mathit{sum} \; (\lambda x. x) \,,
  \quad
  s_2 = \mathit{sum} \; (\lambda x. x^2) \,.
$$
