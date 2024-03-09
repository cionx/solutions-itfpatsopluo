# Exercise 3.3.4

> Recall the definition of factorials $n!$ from Exercise 1.11.1.  
> a) Give a step function $f$ such that $(n!, n) = f^n (1, 0)$.  
> b) Declare a function $\mathit{faci}$ computing factorials with iteration.  
> c) Declare a tail-recursive function $\mathit{fac}'$ such that $\mathit{fac}' \; n \; 1 \; 0 = n!$.
>    Follow the recipe from Exercise 3.3.3.

---

### a)

We can use the step function $f \colon (p, k) \mapsto (p \cdot (k + 1), k + 1)$.

### b)

In view of part a) of this exercise we can implement the function $\mathit{faci}$ as follows:
```ocaml
let faci n =
  fst (iter (fun (p, k) -> (p * (k + 1), k + 1)) n (1, 0))
```

### c)

We can implement the function $\mathit{fac}'$ as follows:
```ocaml
let rec fac' n p k =
  if n = 0 then p else fac' (n - 1) (p * (k + 1)) (k + 1)
```
