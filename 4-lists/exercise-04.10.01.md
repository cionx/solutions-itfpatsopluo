# Exercise 4.10.1 (Graded power list)

> Declare a function $\mathit{gpow} : \forall \alpha. \; \mathbb{N} \to \mathcal{L}(\alpha) \to \mathcal{L}(\mathcal{L}(\alpha))$ such that $\mathit{gpow} \enspace k \enspace l$ yields a list containing all sublists of $l$ of length $k$.

---

We make the following observations:
- The only sublist of length $0$ is the empty list, $[\,]$.
- If $k > 0$ then the empty list has not sublists of length $k$.
- In general, a sublist of $x :: l$ of length $k$ is either a sublist of $l$ of length $k$ or of the form $x :: l'$ for a sublist $l'$ of $l$ of length $k - 1$.

We thus arrive at the following declaration:
$$
  \begin{gathered}
    \mathit{gpow} : \forall \alpha. \; \mathbb{N} \to \mathcal{L}(\alpha) \to \mathcal{L}(\mathcal{L}(\alpha)) \,, \\
    \begin{aligned}
      \mathit{gpow} \enspace 0 \enspace l
      &\coloneqq
      [ [\,] ] \,,
      \\
      \mathit{gpow} \enspace (k > 0) \enspace []
      &\coloneqq
      [ \, ] \,,
      \\
      \mathit{gpow} \enspace k \enspace (x :: l)
      &\coloneqq
      \mathit{gpow} \enspace k \enspace l \enspace \mathbin{@} \enspace \mathit{map} \enspace (λ l. x :: l) \enspace (\mathit{gpow} \enspace (k - 1) \enspace l).
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec gpow k l =
  if k < 0 then invalid_arg "gpow" else
    match k, l with
    | 0, _ -> [[]]
    | _, [] -> []
    | k, x :: l -> gpow k l @ List.map (fun l -> x :: l) (gpow (k - 1) l)
```
