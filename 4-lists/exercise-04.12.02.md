# Exercise 4.12.2

> Declare a function $\mathit{perm} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathcal{L}(\alpha) \to \mathbb{B}$ that tests whether two lists are equal up to reordering.

---

We can first sort both lists and then check them for equality:
$$
  \begin{gathered}
    \mathit{perm} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathcal{L}(\alpha) \to \mathbb{B} \,, \\
    \mathit{perm} \enspace l_1 \enspace l_2
    \coloneqq
    (\mathit{isort} \enspace l_1) = (\mathit{isort} \enspace l_2) \,.
  \end{gathered}
$$
In OCaml code:
```ocaml
let perm l1 l2 =
  (isort l1) = (isort l2)
```
