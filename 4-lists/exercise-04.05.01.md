# Exercise 4.5.1

> Declare $\mathit{mem}$ and $\mathit{exists}$ in OCaml.
> For $\mathit{mem}$ consider two possibilities, one with $\mathit{exists}$ and one without helper function.

---

We can declare $\mathit{mem}$ as follows:
```ocaml
let rec mem x l =
  match l with
  | [] -> false
  | h :: t -> x = h || mem x t
```

We can declare $\mathit{exists}$ as follows:
```ocaml
let rec exists p l =
  match l with
  | [] -> false
  | h :: t -> p h || exists p t
```

We can now re-declare $\mathit{mem}$ in terms of $\mathit{exists}$:
```ocaml
let mem x l =
  exists (( = ) x) l
```
