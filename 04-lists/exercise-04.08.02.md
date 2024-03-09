# Exercise 4.8.2

> Declare a function
> $$
>   \mathit{nth\_list} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathit{int} \to \mathcal{L}(\alpha)
> $$
> that agrees with $\mathit{nth\_opt}$ but returns a list with at most one element.

---

We can implement $\mathit{nth\_list}$ the same way as $\mathit{nth\_opt}$:
```ocaml
let rec nth_opt l n =
  match l with
  | [] -> []
  | x :: l -> if n < 1 then [x] else nth_opt l (n-1)
```
