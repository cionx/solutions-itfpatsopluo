# Exercise 5.2.6 (Minimal Trees)

> A tree is _minimal_ if its size is minimal for all trees of the same depth.
> The two minimal trees of depth `2` look as follows:
> ```text
>    B                      B
>   / \                    / \
>  /   \                  /   \
> A     B                B     A
>      / \              / \
>     /   \            /   \
>    A     A          A     A
> ```
> 1. Declare a function `mtree : N → tree` that yields a minimal tree of depth `n`.
>    Also give a tail-recursive function such that `mtree' n A` yields a minimal tree of depth `n`.
> 2. Declare a function `check : tree → O(N)` such that `check t = Some n` if `t` is a minimal tree of depth `n`, and `check t = None` if `t` is not minimal.

---



### 1.

The following trees are minimal:
```text
  B
 / \
A   B
   / \
  A   B
     / \
    A   .
         .
          .
           \
            B
           / \
          A   B
             / \
            A   A
```
We can thus reuse the function `dtree` from Exercise 5.2.4, renaming it to `mtree`:
```text
      mtree : N → tree
      mtree 0 := A
mtree (n + 1) := B(A, mtree n)
```
In OCaml code:
```ocaml
let rec mtree n =
  if n = 0 then A else B (A, mtree (n - 1))
```

The function `mtree'` can be declared as follows:
```text
      mtree' : N → tree → tree
      mtree' 0 t := t
mtree' (n + 1) t := mtree' n B(A, t)
```
In OCaml code:
```ocaml
let rec mtree' n t =
  if n = 0 then t else mtree' (n - 1) (B (A, t))
```



### 2.

We can check that `t` is either `A`, or that one of the branches of `t` is `A` and the other branch is minimal.
We thus get the following declaration for `check` in OCaml:
```ocaml
let rec check t =
  match t with
  | A -> Some 0
  | B (A, t) | B (t, A) -> begin
    match check t with
    | None -> None
    | Some n -> Some (n + 1)
    end
  | B (B _, B _) -> None
```
