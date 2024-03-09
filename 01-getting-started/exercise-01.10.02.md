# Exercise 1.10.2

> Declare a function $\mathit{sqrt}'$ such that $\mathit{sqrt} \mathop{} x = \mathit{sqrt}' \mathop{} x \mathop{} 0$ by specializing $\mathit{first}$ to the test $\lambda k. (k + 1)^2 > x$.

---

We can declare the function $\mathit{sqrt}'$ as
$$
  \mathit{sqrt}' \; x \; n
  \coloneqq
  \mathit{first} \; (\lambda k. (k + 1)^2 > x) \; n \,.
$$
