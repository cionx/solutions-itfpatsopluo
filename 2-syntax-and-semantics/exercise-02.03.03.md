# Exercise 2.3.3

> Give two inference rules for judgments $x \mathbin{\dot{<}} y$ such that a judgment $x \mathbin{\dot{<}} y$ is derivable if and only if $x + k \cdot 5 = y$ for some $k ≥ 1$.

---

(We once again use `<` for $\mathbin{\dot{<}}$.)

We can use the following two inference rules:
```text
                     x < y
---------          ---------
x < x + 5          x < y + 5
```
