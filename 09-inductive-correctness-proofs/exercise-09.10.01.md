# Exercise 9.10.1

> For each of the recursive applications of `pfac'` give the condition one has to verify to establish `safe2` as an invariant.

---

We have to verify the following implications:
```text
safe2 k x → safe2 k (x / k)   if k^2 <= x and k | x
safe2 k x → safe2 (k + 1) x   if k^2 <= x and not k | x
```
