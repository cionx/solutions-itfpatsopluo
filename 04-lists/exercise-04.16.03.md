# Exercise 4.16.3 (Boundedness)

> Declare a function
> $$
>   \mathit{bound} : \forall \alpha \beta. \; \mathit{map} \enspace \alpha \enspace \beta \to \alpha \to \mathit{bool}
> $$
> that checks whether a map binds a given key.
> Note that you can define bound using \mathit{lookup}.

---

We can explicitly declare $\mathit{bound}$ as follows:
$$
  \begin{gathered}
    \mathit{bound} : \forall \alpha \beta. \; \mathit{map} \enspace \alpha \enspace \beta \to \alpha \to \mathit{bool} \,, \\
    \begin{aligned}
      \mathit{bound} \enspace [\,] \enspace a
      &\coloneqq
      \mathsf{false} \,,
      \\
      \mathit{bound} \enspace ((a', b') :: m') \enspace a
      &\coloneqq
      a = a' \mathbin{||} \mathit{bound} \enspace m' \enspace a \,.
    \end{aligned}
  \end{gathered}
$$

In OCaml code:
```ocaml
let rec bound m a =
  match m with
  | [] -> false
  | (a', _) :: m' -> a = a' || bound m' a
```

We can also implement $\mathit{bound}$ in terms of $\mathit{lookup}$ using pattern matching:
```ocaml
let bound m a =
  match lookup m a with
  | None -> false
  | Some _ -> true
```
