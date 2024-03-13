# Exercise 1.9.2

> Express the one-argument functions described by the expressions `x^2`, `x^3` and `(x + 1)^2` with lambda expressions in mathematical notation.
> Translate the lambda expressions to expressions in OCaml and have them type checked.
> Do the same for the two-argument function described by the expression `x < k^2`.

---
The lambda expressions are as follows:
```text
λ x. x^2
λ x. x^3
λ x. (x + 1)^2
λ x k. x < k^2
```
The corresponding OCaml expressions are as follows:
```ocaml
fun x -> x * x

fun x -> x * x * x

fun x -> (x + 1) * (x + 1)

fun x k -> x < k * k
```
The first three expressions are of type `int → int`, the fourth one is of type `int → int → int`.
