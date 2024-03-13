# Exercise 5.2.4

> Define and declare a function `dtree : N → tree` that for `n` yields a tree of depth `n` and size `2 n + 1`.

---

We can choose the required trees to be of the following form:
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
We can construct these trees as follows:
```text
      dtree : N → tree
      dtree 0 := A
dtree (n + 1) := B(A, dtree n)
```
In OCaml code:
```ocaml
let rec dtree n =
  if n = 0 then A else B (A, dtree (n - 1))
```
