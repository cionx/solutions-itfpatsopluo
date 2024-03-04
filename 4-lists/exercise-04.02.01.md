# Exercise 4.2.1

> Define a function $\mathit{null} : \forall \alpha. \mathcal{L}(\alpha) \to \mathbb{B}$ testing whether a list is the empty list.
> Do not use the equality test.

---

We can use list recursion:
$$
  \begin{gathered}
    \mathit{null} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathbb{B} \,, \\
    \begin{aligned}
      \mathit{null} \; []       &\coloneqq \mathsf{true} \,, \\
      \mathit{null} \; (x :: l) &\coloneqq \mathsf{false} \,.
    \end{aligned}
  \end{gathered}
$$
