# Exercise 1.10.7

> Let $f \colon \mathbb{N} \to \mathbb{N}$ be strictly increasing.
> Convince yourself that the functions
> $$
>   \begin{aligned}
>     &\lambda x. \mathit{first} \; (\lambda k. f(k) = x)     \; 0 \\
>     &\lambda x. \mathit{first} \; (\lambda k. f(k) \geq x)  \; 0 \\
>     &\lambda x. \mathit{first} \; (\lambda k. f(k + 1) > x) \; 0
>   \end{aligned}
> $$
> all invert $f$ and find out how they differ.

---

We denote these functions by $g_1$, $g_2$ and $g_3$ respectively.

### First function

The function $g_1$ maps $x$ to its minimal preimage under $f$.
If no such preimage exists, then $g_1$ does not terminate.
The function $g_1$ is therefore partial (unless $f$ is the identity function).

### Second function

The function $g_2$ is total.

If $x = f(n)$ for some integer $n$ then $f(k) < x$ for every $k < n$.
The number $n$ is therefore minimal with the property that $f(n) \geq x$.
Consequently, $g_2(x) = n$, and thus $g_2(f(n)) = n$.

We have $f(g_2(x)) \geq x$ for every $x$.

### Third function

The function $g_3$ is total.

If $x = f(n)$ for some integer $n$ then $f(k) < f(n) = x$ for every $k < n$ but $f(n + 1) > f(n) = x$.
The integer $n$ is therefore minimal with the property that $f(n + 1) > x$.
Consequently, $g_3(x) = n$, and thus $g_3(f(n)) = n$.

For every $x \geq f(0)$ we can characterize $g_3(x)$ as the maximal integer $n$ for which $f(n) \leq x$.
We thus have $f(g_3(x)) \leq x$ for every $x \geq f(0)$.
