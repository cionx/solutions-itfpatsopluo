# Exercise 4.8.3

> Declare a function $\mathit{find\_opt} : \forall \alpha. \; \alpha \to \mathcal{L}(\alpha) \to \mathcal{O}(\mathbb{N})$ that returns the first position of a list a given value appears at.
> For instance, we want $\mathit{find\_opt} \enspace 7 \enspace [3, 7, 7] = \mathit{Some} \enspace 1$ and $\mathit{find\_opt} \enspace 2 \enspace [3, 7, 7] = \mathit{None}$.

---

We can declare the function $\mathit{find\_opt}$ as follows:
```ocaml
let rec find_opt' x l n =
  match l with
  | [] -> None
  | h :: t -> if x = h then Some n else find_opt' x t (n + 1)

let find_opt x l =
  find_opt' x l 0
```
