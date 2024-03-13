# Exercise 8.6.2 (Ternary Trees)

> Consider ternary trees as follows:
> ```text
> tree ::= A | B(tree, tree, tree)
> ```
> 1. Declare a function that yields the size of ternary trees.
> 2. Declare a function that yields the depth of ternary trees.
> 3. Declare a linear-time function that yields a ternary tree of depth `n` that has maximal size.
> 4. Declare a linear-time function that yields a ternary tree of depth `n` that has minimal size.
> 5. Give an explicit formula for the size of maximal ternary trees of depth n.
> 6. Give an explicit formula for the size of minimal ternary trees of depth n.

---

### 1.

We can declare this function as follows:
```text
            size : tree → N
            size A := 1
size B(t1, t2, t3) := 1 + size t1 + size t2 + size t3
```
In OCaml code:
```ocaml
let rec size t = match t with
  | A -> 1
  | B (t1, t2, t3) -> 1 + size t1 + size t2 + size t3
```

### 2.

We can declare this function as follows:
```text
            depth : tree → N
            depth A := 0
depth B(t1, t2, t3) := 1 + max(depth t1, depth t2, depth t3)
```
In OCaml code:
```ocaml
let rec depth t = match t with
  | A -> 0
  | B (t1, t2, t3) -> 1 + max (depth t1) (max (depth t2) (depth t3))
```

### 3.

It can be shown by induction that for every `n >= 0` there exists a unique maximal ternary AB-tree of depth `n`;
for `n >= 1` it is of the form `B(t, t, t)` where `t` is the maximal ternary AB-tree of depth `n - 1`.
We can therefore declare the required function as follows:
```text
      max_tree : N → tree
      max_tree 0 := A
max_tree (n + 1) := let t = max_tree n in B(t, t, t)
```
In OCaml code:
```ocaml
let rec max_tree n =
  if n = 0 then A else let t = max_tree (n - 1) in B (t, t, t)
```

### 4.

It can be shown by induction that for every `n >= 1` every minimal ternary AB-tree of depth `n` is of the form `B(A, A, t)`, `B(A, t, A)` or `B(t, A, A)` where `t` is a minimal ternary AB-tree of depth `n - 1`.
We can therefore declare the required function as follows:
```text
      min_tree : N → tree
      min_tree 0 := A
min_tree (n + 1) := B(A, A, min_tree n)
```
In OCaml code:
```ocaml
let rec min_tree n =
  if n = 0 then A else B (A, A, min_tree (n - 1))
```

### 5.

If `s(n)` denotes the size of the maximal ternary AB-tree of depth `n`, then we have the recurrence relation
```text
s(0) = 1,     s(n + 1) = 3 s(n) + 1
```
The explicit formula for `s(n)` is `s(n) = (3^(n + 1) - 1) / 2`.

### 6.

If `s(n)` denotes the size of a minimal ternary AB-tree of depth `n`, then we have the recurrence relation
```text
s(0) = 1,     s(n + 1) = s(n) + 3
```
The explicit formula for `s(n)` is `s(n) = 1 + 3 n`.
