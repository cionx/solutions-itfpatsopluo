# Exercise 3.3.4

> Recall the definition of factorials `n!` from Exercise 1.11.1.
> 1. Give a step function `f` such that `(n!, n) = f^n (1, 0)`.
> 2. Declare a function `faci` computing factorials with iteration.
> 3. Declare a tail-recursive function `fac'` such that `fac' n 1 0 = n!`.
>    Follow the recipe from Exercise 3.3.3.

---

### 1.

We can use the step function `f : (p, k) -> (p * (k + 1), k + 1)`.

### 2.

In view of part 1 of this exercise we can implement the function `faci` as follows:
```ocaml
let faci n =
  fst (iter (fun (p, k) -> (p * (k + 1), k + 1)) n (1, 0))
```

### 3.

We can implement the function `fac'` as follows:
```ocaml
let rec fac' n p k =
  if n = 0 then p else fac' (n - 1) (p * (k + 1)) (k + 1)
```
