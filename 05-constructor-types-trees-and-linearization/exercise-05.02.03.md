# Exercise 5.2.3

> Define and declare a function $\mathit{mirror} : \mathit{tree} \to \mathit{tree}$ that yields a tree whose graphical representation is the mirror image of the given tree.
> For instance, we want $\mathit{mirror} \enspace (B(BAA)A) = BA(BAA)$ and $\mathit{mirror} \enspace (B(BA(BAA))A) = BA(B(BAA)A)$.

---

We can declare this function as follows:
$$
  \begin{gathered}
    \mathit{miror} : \mathit{tree} \to \mathit{tree} \,, \\
    \begin{aligned}
      \mathit{mirror} \enspace A
      &\coloneqq
      A \,,
      \\
      \mathit{mirror} \enspace (B \; t_1 \; t_2)
      &\coloneqq
      B \enspace (\mathit{mirror} \enspace t_2) \enspace (\mathit{mirror} \enspace t_1) \,.
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec mirror t =
  match t with
  | A -> A
  | B (t1, t2) -> B (mirror t2, mirror t1)
```
