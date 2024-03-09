# Exercise 1.10.5

> Declare inverse functions for the following functions:  
> a) $\lambda n. n^3$,  
> b) $\lambda n. n^k$ for $k ≥ 2$,  
> c) $\lambda n. k^n$ for $k ≥ 2$.

---

### a)

We can use the rounded-down cube root function from Exercise 1.10.3:
$$
  \mathit{cbrt} \; x
  \coloneqq
  \mathit{first} \; (\lambda k. (k + 1)^3 > x) \; 0 \,.
$$

### b)

We can use the rounded-down root function $\lfloor \sqrt[k]{x} \rfloor$:
$$
  \mathit{root} \; k \; x
  \coloneqq
  \mathit{first} \; (\lambda n. (n + 1)^k > x) \; 0 \,.
$$

### c)

We can use the rounded-down logarithm function $\lfloor \log_k x \rfloor$:
$$
  \mathit{log} \; k \; x
  \coloneqq
  \mathit{first} \; (\lambda n. k^{n + 1} > x) \; 0 \,.
$$
