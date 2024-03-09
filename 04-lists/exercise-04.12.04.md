# Exercise 4.12.4 (Sorting with duplicate deletion)

> Declare a function $\mathit{dsort} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathcal{L}(\alpha)$ that sorts a list and removes all duplicates.
> For instance, $\mathit{dsort} \enspace [5, 3, 2, 5, 2, 3] = [2, 3, 5]$.

---

We first sort the list and then remove duplicates:
$$
  \begin{gathered}
    \mathit{rm\_dup} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathcal{L}(\alpha) \,, \\
    \begin{aligned}
      \mathit{rm\_dup} \enspace [\,]
      &\coloneqq
      [\,] \,,
      \\
      \mathit{rm\_dup} \enspace [x]
      &\coloneqq
      [x] \,,
      \\
      \mathit{rm\_dup} \enspace x :: y :: l
      &\coloneqq
      \text{if } x = y \text{ then } \mathit{rm\_dup} \enspace (y :: l) \text{ else } x ::\mathit{rm\_dup} \enspace (y :: l)\,,
    \end{aligned}
  \end{gathered}
$$
More explicitly, this function collapses segments of equal elements into a single element.

We can now declare $\mathit{dsort}$:
$$
  \begin{gathered}
    \mathit{dsort} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathcal{L}(\alpha) \,, \\
      \mathit{dsort} \enspace l
      \coloneqq
      \mathit{rm\_dup} \enspace (\mathit{isort} \enspace l) \,.
  \end{gathered}
$$

In OCaml code:
```ocaml
let rec rm_dup l =
  match l with
  | [] -> []
  | [x] -> [x]
  | x :: y :: l ->
    let l' = rm_dup (y :: l) in
    if x = y then l' else x :: l'

let dsort l =
  rm_dup (isort l)
```
