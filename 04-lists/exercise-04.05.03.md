# Exercise 4.5.3

> Declare a tail-recursive function
> $$
>   \mathit{forall} : \forall \alpha. \; (\alpha \to \mathbb{B}) \to \mathcal{L}(\alpha) \to \mathbb{B}
> $$
> testing whether all elements of a list satisfy a given test.
> Consider two possibilities, one without a helper function, and one with $\mathit{exists}$ exploiting the equivalence $(\forall x \in l. p(x)) \longleftrightarrow (\neg \exists x \in l. \neg p(x))$.

---

We can declare $\mathit{forall}$ as follows:
$$
  \begin{gathered}
    \mathit{forall} : \forall \alpha. \; (\alpha \to \mathbb{B}) \to \mathcal{L}(\alpha) \to \mathbb{B} \,, \\
    \begin{aligned}
      \mathit{forall} \; p \; [\,] &\coloneqq \mathsf{true} \,, \\
      \mathit{forall} \; p \; (x :: l) &\coloneqq p \; x \mathbin{\mathtt{\&\&}} \mathit{forall} \; p \; l \,.
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec forall p l =
  match l with
  | [] -> true
  | x :: l -> p x && forall p l
```

We could also implement $\mathit{forall}$ in terms of $\mathit{exists}$ as follows:
$$
  \mathit{forall} \; p \; l
  \coloneqq
  \mathit{not} \; (\mathit{exists} \enspace (\lambda x. \mathit{not} \; (p \; x)) \enspace l)
$$
In Ocaml code:
```ocaml
let forall p l =
  let q x = not (p x) in
  not (List.exists q l)
```
