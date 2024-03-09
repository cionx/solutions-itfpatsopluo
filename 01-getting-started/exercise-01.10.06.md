
# Exercise 1.10.6

> Declare a function $\mathit{inv} \colon (\mathbb{N} \to \mathbb{N}) \to (\mathbb{N} \to \mathbb{N})$ that given a strictly increasing function $f$ yields a function inverting $f$.
> Then express the functions from Exercise 1.10.5 using $\mathit{inv}$.

---

We can declare $\mathit{inv}$ as follows:
$$
  \mathit{inv} \; f \; x
  \coloneqq
  \mathit{first} \; (\lambda k. f(k + 1) > x) \; 0
$$

We have already expressed the functions from Exercise 1.10.5 in this way.
