# Exercise 5.2.1

> Define and declare a function `depth : tree → N` that yields the depth of a tree.
> For instance, we want `depth (B(BAA)A) = 2`.

---

We can declare the function `depth` as follows:
```text
        depth : tree → N ,
        depth A := 0 ,
depth (B t1 t2) := 1 + max (depth t1) (depth t2) .
```
In OCaml code:
```ocaml
let rec depth t =
  match t with
  | A -> 0
  | B (t1, t2) -> 1 + max (depth t1) (depth t2)
```
