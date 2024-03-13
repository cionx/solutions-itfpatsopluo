# Heap representation with structure sharing 12P

> We consider AB-trees
> ```ocaml
> type tree  = A | B of tree * tree
> ```
> and assume a heap with an operation
> ```ocaml
> alloc : int list -> address
> ```
> allocating blocks and an operation
> ```ocaml
> get : address -> index -> int
> ```
> reading the fields of a block.
> As usual, address and index are names for the type `int`, and the fields of a block are numbered starting from `0`.
> 1. Declare a function `putMaxTree : int → address` that for `n >= 0` stores the maximal AB-tree of depth `n` in the heap using blocks of length `2` and taking running time `O(n)`.
> 2. Declare a function `getTree : address → tree` that reads AB-trees from the heap preserving structure sharing between siblings.
>    A call `getTree (putMaxTree n)` should take running time `O(n)`.

---

We encode AB-trees as blocks as discussed in the textbook.

### 1.

We can declare the function `putMaxTree` as follows:
```ocaml
let rec putMaxTree n =
  if n <= 0 then -1
  else let a = putMaxTree (n - 1) in alloc [a; a]
```

### 2.

We can declare the function `getTree` as follows:
```ocaml
let rec getTree a =
  if a = -1 then A
  else
    let a1 = get a 0 in
    let a2 = get a 1 in
    if a1 = a2
    then let t = getTree a1 in B (t, t)
    else B (getTree a1, getTree a2)
```
