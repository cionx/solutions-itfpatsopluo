# Exercise 1.11.1 (Factorials)

> In mathematics, the factorial of a positive integer `n`, denoted by `n!`, is the product of all positive integers less than or equal to `n`:
> ```text
> n! = n * (n − 1) * ... * 2 * 1
> ```
> For instance,
> ```text
> 5! = 5 * 4 * 3 * 2 * 1 = 120 .
> ```
> In addition, `0!` is defined as `1`.
> We capture this specification with a recursive function defined as follows:
> ```text
>        ! : N → N
>       0! := 1
> (n + 1)! := (n + 1) * n!
> ```
> 1. Declare a function `fac : int → int` computing factorials.
> 2. Define a tail recursion function `f : N → N → N` such that `n! = f 1 n`.
> 3. Declare a tail recursive function `fac' : int → int → int` such that `fac' 1` computes factorials.

---

### 1.

We can declare this function as follows in OCaml:
```ocaml
let rec fac n =
  if n = 0 then 1 else n * fac (n - 1)
```

### 2.

We can define the function `f` as follows:
```text
      f : N → N → N
      f a 0 := a
f a (n + 1) := f ((n + 1) * a) n
```
Indeed:
```text
  f 1 n
= f n (n - 1)
= f ((n - 1) * n) (n - 2)
= f ((n - 2) * (n - 1) * n) (n - 3)
= ...
= f (1 * 2 * ... * (n - 2) * (n - 1) * n) 0
= 1 * 2 * ... * (n - 2) * (n - 1) * n
= n!
```

### 3.

We can declare the function `fac'` as follows in OCaml:
```ocaml
let rec fac' a n =
  if n = 0 then a else fac' (n * a) (n - 1)
```
