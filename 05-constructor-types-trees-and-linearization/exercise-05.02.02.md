# Exercise 5.2.2

> Define and declare a function $\mathit{breadth} : \mathit{tree} \to \mathbb{N}$ that yields the number of leaves a tree has.

---

We can declare this function as follows:
$$
  \begin{gathered}
    \mathit{breadth} : \mathit{tree} \to \mathbb{N} \,, \\
    \begin{aligned}
      \mathit{breadth} \enspace A
      &\coloneqq
      1 \,,
      \\
      \mathit{breadth} \enspace (B \; t_1 \; t_2)
      &\coloneqq
      \mathit{breadth} \enspace t_1 + \mathit{breadth} \enspace t_2 \,.
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec breadth t =
  match t with
  | A -> 1
  | B (t1, t2) -> breadth t1 + breadth t2
```
