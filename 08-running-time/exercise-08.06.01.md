# Exercise 8.6.1 (Minimal Trees)

We call an AB-tree of depth `n` _minimal_ if its size is minimal for all AB-tree of depth `n`.
1. Argue that there are two different minimal AB-trees of depth `2`.
2. Declare a linear-time function that given `n` yields a minimal AB-tree of depth `n`.
3. Declare a linear-time function that given `n` yields the size of minimal AB-trees of depth `n`.
4. Give an explicit formula for the size of minimal AB-trees of depth `n`.

---

One can show by induction that for every `n >= 1` every minimal AB-tree of depth `n` is of the form `B(t, A)` or `B(A, t)` for a minimal AB-tree `t` of depth `n - 1`.

### 1.

The only tree of depth `0` is `t0 := A`.
Consequently, the only minimal tree of depth `1` is `t1 := B(A, A)`, since both `B(t0, A) = B(A, A)` and `B(A, t0) = B(A, A)`.
Consequently, the only two minimal trees of depth `2` are `B(t1, A) = B(B(A, A), A)` and `B (A, t1) = B(A, B(A, A))`.

### 2.

We can use the following function:
```text
      min : N → tree
      min 0 := A
min (n + 1) := B (A, min n)
```
In OCaml code:
```ocaml
let rec min n =
 if n = 0 then A else B (A, min (n - 1))
```

### 3. and 4.

We can show by induction that a minimal AB-tree of depth `n` has size `2 n + 1`.
This expression can be computed in constant time:
```text
min_size n := 2 n + 1
```
In OCaml code:
```ocaml
let min_size n =
  2 * n + 1
```
