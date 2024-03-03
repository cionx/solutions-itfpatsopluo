# Exercise 3.3.2

> Declare a function $f \colon \mathbb{N} \to \mathbb{N}$ computing the sequence
> $$
>   0, 1, 1, 2, 4, 7, 13, \dotsc
> $$
> obtained by starting with $0, 1, 1$ and then adding new elements as the sum of the three preceding elements.
> For instance, $f(3) = 2$, $f(4) = 4$, and $f(5) = 7$.

---

We can use the step function $h \colon (a, b, c) \mapsto (b, c, a + b + c)$ which satisfies
$$
  h^n (0, 1, 1) = (f(n), f(n + 1), f(n + 2)) \,.
$$
The resulting OCaml code is as follows:
```ocaml
let f n =
  let (x, _, _) =
    iter (fun (a, b, c) -> (b, c, a + b + c)) n (0, 1, 1)
  in x
```
