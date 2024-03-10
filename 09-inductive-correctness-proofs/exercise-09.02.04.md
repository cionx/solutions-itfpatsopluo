# Exercise 9.2.4

> Prove `map f (l1 @ l2) = map f l1 @ map f l2`.

---

We use structural induction over `l1`.

The base case:
```text
  map f ([] @ l2)
= map f l2              definition of @
= [] @ map f l2         definition of @
= map f [] @ map f l2   definition of map
```
The induction step:
```text
  map f ((x :: l1) @ l2)
= map f (x :: (l1 @ l2))        definition of @
= f x :: map f (l1 @ l2)        definition of map
= f x :: (map f l1 @ map f l2)  induction hypothesis
= (f x :: map f l1) @ map f l2  definition of @
= map f (x :: l1) @ map f l2    definition of map
```
