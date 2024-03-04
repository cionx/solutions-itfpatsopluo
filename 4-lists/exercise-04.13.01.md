# Exercise 4.13.1

Declare a function
$$
  \mathit{reorder} : \forall \alpha \beta. \; \mathcal{L}(\alpha \times \beta) \to \mathcal{L}(\alpha \times \beta)
$$
that reorders a list of pairs such that the first components of the pairs are
ascending.
If there are several pairs with the same first component, the original order of the pairs should be preserved.
For instance, we want $\mathit{reorder} \enspace [(5, 3), (3, 7), (5, 2), (3, 2)] = [(3, 7), (3, 2), (5, 3), (5, 2)]$.
Declare reorder as a one-liner using the sorting function $\mathit{gisort}$.

---

The function $\mathit{gisort}$ uses $\mathit{foldl}$ instead of $\mathit{fold}$, which we need to counteract by reversing the input list.
We can declare $\mathit{reorder}$ as follows:
$$
  \begin{gathered}
    \mathit{reorder} : \forall \alpha \beta. \; \mathcal{L}(\alpha \times \beta) \to \mathcal{L}(\alpha \times \beta) \,, \\
    \mathit{reorder} \enspace l
    \coloneqq
    \mathit{gisort} \enspace (λ p q. \pi_1 p \leq \pi_1 q) \enspace (\mathit{rev} \enspace l) \,.
  \end{gathered}
$$

In OCaml code:
```ocaml
let reorder l =
  gisort (fun (x, _) (y, _) -> x <= y) (List.rev l)
```
