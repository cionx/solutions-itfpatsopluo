# Minimal and maximal AB-trees 16P

> We consider AB-trees
> ```ocaml
> type tree = A | B of tree * tree
> ```
> 1. Declare a function `min : N → tree` that for `n` yields an AB-tree of depth `n` that has minimal size.
>    For depth `2` the trees `B(B(A, A), A)` and `B(A, B(A, A))` have minimal size.
> 2. Declare a function `max : N → tree` that for `n` yields an AB-tree of depth `n` that has maximal size.
>    Make sure the running time of your function is linear in the depth of the tree.
> 3. Declare a function `check : tree → O(N)` such that `check(t) = Some(n)` if `t` is a minimal tree of depth `n`, and `check(t) = None` if `t` is not minimal.

---

### 1.

The only AB-tree of depth `0` is `A`;
it is therefore the unique minimal AB-tree of depth `0`.
The minimal AB-trees of depth `n`, with `n >= 1`, are precisely those AB-trees of the form `B(A, t)` or `B(t, A)` for a minimal AB-tree `t` of depth `n - 1`.
These observations result in the following declaration of `min`:
```ocaml
let rec min n =
  if n = 0 then A else B (A, min (n - 1))
```

### 2.

The only AB-tree of depth `0` is `A`;
it is therefore the unique maximal AB-tree of depth `0`.
The unique maximal AB-tree of depth `n`, with `n >= 1`, is `B(t, t)` where `t` is the unique maximal AB-tree of depth `n - 1`.
These observations yield the following declaration of `max`:
```ocaml
let rec max n =
  if n = 0 then A
  else let t = max (n - 1) in B (t, t)
```

### 3.

We reuse our above, explicit description of minimal AB-trees:
```ocaml
let rec check t = match t with
  | A -> true
  | B (A, t) | B (t, A) -> check t
  | _ -> false
```
