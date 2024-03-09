# Exercise 1.10.3

> The ceiling operator $\lceil x \rceil$ converts a real number into the least integer $y$ such that $x \leq y$.  
> a) Declare a function computing rounded down cube roots $\lfloor \sqrt[3]{x} \rfloor$.  
> b) Declare a function computing rounded up cube roots $\lceil \sqrt[3]{x} \,\rceil$.

---

### a)

The rounded down cube root $\lfloor \sqrt[3]{x} \rfloor$ is the largest integer $k$ for which $k^3 \leq x$, and thus the first integer $k$ with $k \geq 0$ and $(k + 1)^3 > x$.
We can therefore declare the described function as
$$
  \mathit{cbrt} \; x
  \coloneqq
  \mathit{first} \; (\lambda k. (k + 1)^3 > x) \; 0 \,.
$$

### b)

The rounded up cube root $\lceil \sqrt[3]{x} \,\rceil$ is the smallest integer $k$ with $k^3 \geq x$.
We can therefore declare the described function as
$$
  \mathit{cbrt}' \; x
  \coloneqq
  \mathit{first} \; (\lambda k. k^3 \geq x) \; 0 \,.
$$
