# Exercise 11.7.2

> Declare functions such that `getTree (putTree t) = t` holds for all AB-trees that fit into the heap.

---

We can declare the functions `putTree` and `getTree` as follows:
```ocaml
let rec putTree t = match t with
  | A -> -1
  | B (t1, t2) -> alloc' [putTree t1; putTree t2]

let rec getTree a =
  if a = -1 then A
  else
    let a1 = H.get a 0 in
    let a2 = H.get a 1 in
    B (getTree a1, getTree a2)
```
