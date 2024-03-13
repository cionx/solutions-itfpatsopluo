# Exercise 3.4.1

> Declare a test `exists : int → int → (int → bool) → bool` such that `exists m n f = true  <==>  ∃ k, m <= k <= n. f k = true` in two ways:
> 1. Directly following the design of `forall`.
> 2. Using `forall` and boolean negation `not : bool → bool`.

---

### 1.

We can directly implement `exists` as follows:
```ocaml
let rec exists m n f =
  if m > n then false else f m || exists (m + 1) n f
```

### 2.

It follows from De Morgan’s laws that
```text
p1 || ... || pn   <==>   ¬(¬p1 && ... && ¬pn) .
```
We can therefore implement `exists` in terms of `forall` and the negation function `not`:
```ocaml
let rec exists m n f =
  let notf x = not (f x) in
  not (forall m n notf)
```
