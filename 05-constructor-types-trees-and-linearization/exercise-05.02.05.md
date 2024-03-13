# Exercise 5.2.5 (Maximal Trees)

> A tree is _maximal_ if its size is maximal for all trees of the same depth.
> The unique maximal tree of depth 2 looks as follows:
> ```text
>       B
>      / \
>     /   \
>    /     \
>   B       B
>  / \     / \
> A   A   A   A
> ```
> 1. Convince yourself that the two subtrees of a maximal tree are maximal and identical.
> 2. Declare a function `mtree : N → tree` that yields the unique maximal tree of depth `n`.
>    Use a let expression to avoid binary recursion.
>    Also give a tail-recursive function such that `mtree' n A` yields the maximal tree of depth `n`.
> 3. Give a non-maximal tree `t` such that `mirror t = t`.
> 4. Declare a function `check : tree → O(N)` such that `check t = Some n` if `t` is a maximal tree of depth `n`, and `check t = None` if `t` is not maximal.

---



### 1.

We show the following three propositions by induction:
1. The maximal tree of depth `n >= 0` is unique.
2. If `n >= 1` then the maximal tree of depth `n` is of the form `B(t, t)` where `t` is the maximal tree of depth `n - 1`.
3. The unique maximal tree of depth `n` has size `2^(n + 1) - 1`.

The only tree of depth zero is `A`, which entails the first point for `n = 0`.
It also has size `1 = 2^(0 + 1) - 1`, which shows the third point for `n = 0`.

Suppose now that `n >= 1` and let `t` be a maximal tree of depth `n`.
The tree `t` is in particular not of depth zero, and thus of the form `B(t1, t2)` for some trees `t1` and `t2`, of depths `d1` and `d2` respectively. We have
```text
n = 1 + max d1 d2
```
and thus `d1, d2 < n`.

Let `t1'` and `t2'` be the maximal tree of depth `n - 1` and let `t' ≔ B(t1', t2')`.
The tree `t'` is again of depth `n` whence `size t >= size t'` by the maximality of `t`.
But we also have
```text
size ti  <=  2^(di + 1) - 1  <=  2^((n - 1) + 1) - 1  =  size ti'
```
by induction hypothesis (third point for `di` and for `n - 1`), therefore
```text
size t  =  1 + size t1 + size t2  <=  1 + size t1' + size t2'  =  size t'
```
It follows that actually `size t = size t'`.
This entails that the inequality `1 + size t1 + size t2 <= 1 + size t1' + size t2'` is actually an equality, whence the two inequalities `size ti <= size ti'` are actually equalities.

We have thus found that `size ti = size ti'` and therefore
```text
size ti  =  size  ti'  =  2^((n - 1) + 1) - 1
```
by induction hypothesis (third point for `n - 1`).
But if `di < n - 1` for some `i` then we would have
```text
size ti  <=  2^(di + 1) - 1  <  2^((n - 1) + 1) - 1
```
by induction hypothesis (third point for `di`).
We thus must have `di = n - 1` for both `i`.

We have thus shown that both `t1` and `t2` are of depth `n - 1` and of size `2^((n - 1) + 1) - 1`.
By induction hypothesis (third point for `n - 1`), this means that both `t1` and `t2` are maximal of depth `n - 1`.
This shows the second point for `n`.
Together with the first point for `n - 1` this further shows the first point for `n`.

Finally, we find that
```text
size t  =  1 + size t1 + size t2
        =  1 + 2^((n - 1) + 1) - 1 + 2^((n - 1) + 1) - 1
        =  2 * 2^n - 1
        = 2^(n + 1) - 1 .
```
This shows the third point for `n`.



### 2.

We can declare the function `mtree` as follows:
```text
      mtree : N → tree
      mtree 0 := A
mtree (n + 1) := B(mtree n, mtree n)
```
In OCaml code:
```ocaml
let rec mtree n =
  if n = 0 then A
  else
    let m' = mtree (n - 1) in
    B (m', m')
```

We can declare the function `mtree'` as follows:
```text
      mtree' : N → tree → tree
      mtree' 0 t := t
mtree' (n + 1) t := mtree' n B(t, t)
```
In OCaml code:
```ocaml
let rec mtree' n t =
  if n = 0 then t else mtree' (n - 1) (B (t, t))
```



### 3.

We can consider the following tree:
```
           B
          / \
         /   \
        /     \
       /       \
      B         B
     / \       / \
    /   \     /   \
   B     A   A     B
  / \             / \
 /   \           /   \
A     A         A     A
```
(This is a minimal counterexample.)



### 4.

We check if `t` is either `A` or of the form `B(t1, t2)` where `t1` and `t2` are maximal trees of the same height.
We can thus declare the function `check` as follows in OCaml:
```ocaml
let rec check t =
  match t with
  | A -> Some 0
  | B (t1, t2) ->
    match check t1, check t2 with
    | None, _ | _, None -> None
    | Some n, Some m ->
      if n = m then Some (n + 1) else None
```
