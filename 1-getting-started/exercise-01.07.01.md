# Exercise 1.7.1

> Define a function $\mathbb{N} \to \mathbb{N}$ that terminates for even numbers and diverges for odd numbers.

---

We can consider the function
$$
  f \colon \mathbb{N} \to \mathbb{N} \,,
  \quad
  f(6)
  \coloneqq
  \begin{cases}
    n    & \text{if $n$ is even,} \\
    f(n) & \text{if $n$ is odd.}
  \end{cases}
$$
