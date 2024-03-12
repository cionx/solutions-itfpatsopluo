# Exercise 11.8.1

> Consider the block representation of AB-trees in the heap `H`.
> 1. Declare a function that writes the maximal AB-tree of depth `n` into the heap such that running time and space consumption in the heap are linear in the depth.
> 2. Declare a function that reads AB-trees from a heap preserving structure sharing between subtrees that are siblings (as in `B(t, t)`).
>    On the heap representations of the trees obtained with the function from (1) your function should only use linear time in the depth of the tree.
> 3. Using physical equality, you can find out in constant time whether two AB-trees in OCaml have the same heap representation.
>    Declare a function writing AB-trees into the heap such that structure sharing between sibling subtrees in OCaml is preserved.
     Test your function with `mtree'`.

---

### 1.

We can declare this function via structure sharing:
```ocaml
let rec mtree n =
  if n <= 0 then -1
  else
    let a = mtree (n - 1) in
    alloc' [a; a]
```

### 2.

We can declare such a function as follows:
```ocaml
let rec getTree a =
  if a = -1 then A
  else
    let a1 = H.get a 0 in
    let a2 = H.get a 1 in
    if a1 = a2
    then let t = getTree a1 in B (t, t)
    else B (getTree a1, getTree a2)
```

### 3.

We can declare such a function as follows:
```ocaml
let rec putTree t = match t with
  | A -> -1
  | B (t1, t2) ->
    if t1 == t2
    then let a = putTree t1 in alloc' [a; a]
    else
      let a1 = putTree t1 in
      let a2 = putTree t2 in
      alloc' [a1; a2]
```
We don’t know how to test this function wit `mtree'`.
