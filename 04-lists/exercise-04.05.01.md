# Exercise 4.5.1

> Declare `mem` and `exists` in OCaml.
> For `mem` consider two possibilities, one with `exists` and one without helper function.

---

We can declare `mem` as follows:
```ocaml
let rec mem x l =
  match l with
  | [] -> false
  | h :: t -> x = h || mem x t
```

We can declare `exists` as follows:
```ocaml
let rec exists p l =
  match l with
  | [] -> false
  | h :: t -> p h || exists p t
```

We can now re-declare `mem` in terms of `exists`:
```ocaml
let mem x l =
  exists (( = ) x) l
```
