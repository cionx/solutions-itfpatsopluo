# Exercise 5.2.3

> Define and declare a function `mirror : tree → tree` that yields a tree whose graphical representation is the mirror image of the given tree.
> For instance, we want `mirror (B(BAA)A) = BA(BAA)` and `mirror (B(BA(BAA))A) = BA(B(BAA)A)`.

---

We can declare this function as follows:
```text
        miror : tree → tree
        mirror A := A
mirror B(t1, t2) := B(mirror t2, mirror t1)
```
In OCaml code:
```ocaml
let rec mirror t =
  match t with
  | A -> A
  | B (t1, t2) -> B (mirror t2, mirror t1)
```
