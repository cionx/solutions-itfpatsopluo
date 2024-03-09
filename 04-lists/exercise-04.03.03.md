# Exercise 4.3.3

> Declare a function $\mathit{flatten} : \forall α. \; \mathcal{L}(\mathcal{L}(\alpha)) \to \mathcal{L}(\alpha)$ concatenating the lists appearing as elements of a given list:
> $$
>   \mathit{flatten} \; [l_1, \dotsc, l_n]
>   =
>   l_1 \mathbin{@} \dotsb \mathbin{@} l_n \mathbin{@} []
> $$
> For instance, we want $\mathit{flatten} \; [[1, 2], [], [3], [4, 5]] = [1, 2, 3, 4, 5]$.

---

A simple, albeit not tail-recursive, declaration is as follows:
```ocaml
let rec flatten lsts =
  match lsts with
  | [] -> []
  | l :: ls -> l @ flatten ls
```
