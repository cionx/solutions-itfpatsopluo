# Exercise 4.16.4 (Deletion)

> Declare a function
> $$
>   \mathit{delete} : \forall \alpha \beta. \; \mathit{map} \; \alpha \; \beta \to \alpha \to \mathit{map} \; \alpha \; \beta
> $$
> deleting the entry for a given key.
> We want $\mathit{lookup} \enspace (\mathit{delete} \enspace l \enspace a) \enspace a = \mathsf{None}$ for all environments $l$ and all keys $a$.

---

We can declare $\mathit{delete}$ as follows:
$$
  \begin{gathered}
    \mathit{delete} : \forall \alpha \beta. \; \mathit{map} \; \alpha \; \beta \to \alpha \to \mathit{map} \; \alpha \; \beta \\
    \begin{aligned}
      \mathit{delete} \enspace [\,] \enspace a
      &\coloneqq
      [\,] \,,
      \\
      \mathit{delet} \enspace ((a', b') :: m') \enspace a
      &\coloneqq
      \text{if } a = a' \text{ then } m' \text{ else } (a', b') :: (\mathit{delete} \enspace m' \enspace a)
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec delete m a =
  match m with
  | [] -> []
  | (a', b') :: m' ->
    if a = a' then m' else (a', b') :: delete m' a
```
