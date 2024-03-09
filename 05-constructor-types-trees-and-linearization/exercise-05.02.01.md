# Exercise 5.2.1

> Define and declare a function $\mathit{depth} : \mathit{tree} \to \mathbb{N}$ that yields the depth of a tree.
> For instance, we want $\mathit{depth} \enspace (B(BAA)A) = 2$.

---

We can declare the function $\mathit{depth}$ as follows:
$$
  \begin{gathered}
    \mathit{depth} : \mathit{tree} \to \mathbb{N} \,, \\
    \begin{aligned}
      \mathit{depth} \enspace A
      &\coloneqq
      0 \,,
      \\
      \mathit{depth} \enspace (B \; t_1 \; t_2)
      &\coloneqq
      1 + \max \enspace (\mathit{depth} \enspace t_1) \enspace (\mathit{depth} \enspace t_2) \,.
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec depth t =
  match t with
  | A -> 0
  | B (t1, t2) -> 1 + max (depth t1) (depth t2)
```
