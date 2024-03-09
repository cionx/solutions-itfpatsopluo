# Exercise 2.3.2

> Give two inference rules for judgments $x \mathbin{\dot{<}} y$ such that your rules derive the same judgments the rules given above derive, but have the additional property that no judgments has more than one derivation.

---

(We once again use `<` for $\mathbin{\dot{<}}$.)

We can use the following two inference rules:
```text
                     x < y
---------          --------
x < x + 1          x < y + 1
```

As an example, here is the unique derivation of $5 \mathbin{\dot{<}} 9$:
```text
-----
5 < 6
-----
5 < 7
-----
5 < 8
-----
5 < 9
```
