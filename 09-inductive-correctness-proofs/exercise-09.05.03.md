# Exercise 9.5.3 (Tail-recursive `sum`)

> Define a tail-recursive variant `sum'` of `sum` and prove `sum' n 0 = sum n`.

---

We declare the function `sum'` as follows:
```text
      sum' : N → N → N
      sum' 0 a := a
sum' (n + 1) a := sum' n (n + 1 + a)
```
We also recall the definition of sum:
```text
      sum : N → N
      sum 0 := 0
sum (n + 1) := sum n + (n + 1)
```

We show by induction over `n` that `sum' n a = sum n + a` for all `n` and all `a`.
The induction predicate is as follows:
```text
λ n. ∀ a. sum' n a = sum n + a
```

Base case:
```text
  sum' 0 a
= a           definition of sum'
= 0 + a       algebra
= sum 0 + a   definition of sum
```
Induction step:
```text
  sum' (n + 1) a
= sum' n (n + 1 + a)    definition of sum'
= sum n + n + 1 + a     induction hypothesis
= sum (n + 1) + a       definition of sum
```

The desired equality `sum' n 0 = sum n` now follows:
```text
sum' n 0 = sum n + 0 = sum n
```
