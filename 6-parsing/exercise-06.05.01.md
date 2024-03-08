# Exercise 6.5.1

> Declare a function $\mathit{depost'} : \mathit{string} → \mathcal{O}(\mathit{tree})$ such that $\mathit{depost'}(s) = \textsf{Some} \; t$ if and only if $\mathit{post}\; (t) = s$.

---

The following function ought to do the job:
```ocaml
let depost' s =
  match depost (lex s) [] with
  | [t] -> Some t
  | _ -> None
```
