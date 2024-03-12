# Exercise 11.7.3

> ABC-trees can be stored in a heap by a representing trees of the forms `B(t1, t2)` and `C(t1, t2)` with blocks with three fields, where two fields hold the subtrees and the additional tag field says whether `B` or `C` is used.
> Declare functions such that `getTree (putTree t) = t` holds for all ABC-trees `t` that fit into the heap.

---

We can declare the functions `putTree` and `getTree` as follows:
```ocaml
let rec putTree t = match t with
  | A -> -1
  | B (t1, t2) -> alloc' [0; putTree t1; putTree t2]
  | C (t1, t2) -> alloc' [1; putTree t1; putTree t2]

let rec getTree a =
  if a = -1 then A
  else
    let variant = H.get a 0 in
    let t1 = getTree (H.get a 1) in
    let t2 = getTree (H.get a 2) in
    match variant with
    | 0 -> B (t1, t2)
    | 1 -> C (t1, t2)
    | _ -> failwith "getTree: unknown tree variant"
```
