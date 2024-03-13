# Exercise 3.3.2

> Declare a function `f : N → N` computing the sequence
> ``
> 0, 1, 1, 2, 4, 7, 13, ...
> ``
> obtained by starting with `0`, `1`, `1` and then adding new elements as the sum of the three preceding elements.
> For instance, `f(3) = 2`, `f(4) = 4`, and `f(5) = 7`.

---

We can use the step function `h : (a, b, c) -> (b, c, a + b + c)` which satisfies
```text
h^n (0, 1, 1) = (f(n), f(n + 1), f(n + 2)) .
```
The resulting OCaml code is as follows:
```ocaml
let f n =
  let (x, _, _) =
    iter (fun (a, b, c) -> (b, c, a + b + c)) n (0, 1, 1)
  in x
```
