# Exercise 4.10.4

> Declare a function $\mathit{filter} : \forall \alpha. \; (\alpha \to \mathbb{B}) \to \mathcal{L}(\alpha) \to \mathcal{L}(\alpha)$ that given a test and a list yields the sublist of all elements that pass the test.
> For instance, we want $\mathit{filter} \enspace (\lambda x. x > 2) \enspace [2, 5, 1, 5, 2] = [5, 5]$.

---

We can declare the function $\mathit{filter}$ as follows:
$$
  \begin{gathered}
    \mathit{filter} : \forall \alpha. \; (\alpha \to \mathbb{B}) \to \mathcal{L}(\alpha) \to \mathcal{L}(\alpha) \,, \\
    \begin{aligned}
      \mathit{filter} \enspace p \enspace [\,]
      &\coloneqq
      [\,] \,, \\
      \mathit{filter} \enspace p \enspace (x :: l)
      &\coloneqq
      \text{if } p \; x \text{ then } x :: (\mathit{filter} \enspace p \enspace l) \text{ else } \mathit{filter} \enspace p \enspace l \,.
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec filter p l =
  match l with
  | [] -> []
  | x :: l ->
    let l' = filter p l in
    if p x then x :: l' else l'
```
