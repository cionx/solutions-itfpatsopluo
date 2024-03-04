# Exercise 4.12.1

> Declare a function $\mathit{sorted} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathbb{B}$ that tests whether a list is sorted.
> Use tail recursion.
> Write the function with a generalized match and show how the generalized match translates into simple matches.

---

We can declare the function $\mathit{sorted}$ as follows:
$$
  \begin{gathered}
    \mathit{sorted} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathbb{B} \,, \\
    \begin{aligned}
      \mathit{sorted} \enspace [\,]
      &\coloneqq
      \mathsf{true} \,, \\
      \mathit{sorted} \enspace [x]
      &\coloneqq
      \mathsf{true} \,, \\
      \mathit{sorted} \enspace x :: y :: l
      &\coloneqq
      x \leq y \mathbin{\mathtt{\&\&}} \mathit{sorted} \enspace (y :: l)\,. \\
    \end{aligned}
  \end{gathered}
$$

In OCaml code:
```ocaml
let rec sorted l =
  match l with
  | [] -> true
  | [_] -> true
  | x :: y :: l -> x <= y && sorted (y :: l)
```
