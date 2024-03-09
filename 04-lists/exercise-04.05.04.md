# Exercise 4.5.4

> Declare a function $\mathit{count} : \forall \alpha. \; \alpha \to \mathcal{L}(\alpha) \to \mathbb{N}$ that counts how often a value appears in a list.
> For instance, we want $\mathit{count} \; 5 \; [2, 5, 3, 5] = 2$.

---

We use an auxiliary function $\mathit{count}'$ that keeps track of how often we have encountered the searched-for element:
$$
  \begin{gathered}
    \mathit{count}' : \forall \alpha. \; \alpha \to \mathcal{L}(\alpha) \to \mathbb{N} \to \mathbb{N} \,, \\
    \begin{aligned}
      \mathit{count'} \; x \; [\,] \; a &\coloneqq a \,, \\
      \mathit{count'} \; x \; (h :: t) \; a &\coloneqq \mathit{count}' \; x \; t \; (\text{if } h = x \text{ then } a + 1 \text{ else } a) \,.
    \end{aligned}
  \end{gathered}
$$
We can then express $\mathit{count}$ in terms of $\mathit{count}'$:
$$
  \mathit{count} \; x \; l \coloneqq \mathit{count}' \; x \; l \; 0 \,.
$$

In OCaml code:
```ocaml
let rec count' x l acc =
  match l with
  | [] -> acc
  | h :: t -> count' x t (if h = x then acc + 1 else acc)

let count x l =
  count' x l 0
```
