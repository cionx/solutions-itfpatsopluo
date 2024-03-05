# Exercise 5.2.4

> Define and declare a function $\mathit{dtree} : \mathbb{N} \to \mathit{tree}$ that for $n$ yields a tree of depth $n$ and size $2n + 1$.

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
$$
  \begin{gathered}
    \mathit{dtree} : \mathbb{N} \to \mathit{tree} \,, \\
    \begin{aligned}
      \mathit{dtree} \; 0
      &\coloneqq
      A \,,
      \\
      \mathit{dtree} \; (n + 1)
      &\coloneqq
      B \; A \; (\mathit{dtree} \; n)
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec dtree n =
  if n = 0 then A else B (A, dtree (n - 1))
```
