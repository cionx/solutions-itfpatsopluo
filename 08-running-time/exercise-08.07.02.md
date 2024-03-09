# Exercise 8.7.2 (Characterizations of asymptotic dominance)

> Show that the following propositions are equivalent for all functions $f, g : \mathbb{N} \to \mathbb{N}$:
> 1. $\exists n_0, k, c. \; \forall n \geq n_0. \; f(n) \leq k \cdot g(n) + c$
> 2. $\exists K. \; \forall n. \; f(n) \leq (g(n) + 1)$.

---

### 1. $\implies$ 2.

Let $n_0$, $k$ and $c$ such that $f(n) \leq k \cdot g(n) + c$ for every $n \geq n_0$.
Let
$$
  K \coloneqq \max( f(0), \dotsc, f(n_0), k, c )
$$
For every $n \leq n_0$ we then have
$$
  f(n) \leq K \leq K \cdot g(n) + K = K \cdot (g(n) + 1) \,,
$$
and for every $n \geq n_0$ we also have
$$
  f(n) \leq k \cdot g(n) + c \leq K \cdot g(n) + K = K \cdot (g(n) + 1) \,.
$$

### 2. $\implies$ 1.

We may choose $n_0 \coloneqq 0$, $k \coloneqq K$ and $c \coloneqq K$.
Then
$$
  f(n) \leq K \cdot (g(n) + 1) = K \cdot g(n) + K = k \cdot g(n) + c
$$
for every $n \geq n_0$.
