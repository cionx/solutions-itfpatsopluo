# Exercise 6.5.1

> Declare a function `depost' : string → O(tree)` such that `depost'(s) = Some t` if and only if `post(t) = s`.

---

The following function ought to do the job:
```ocaml
let depost' s =
  match depost (lex s) [] with
  | [t] -> Some t
  | _ -> None
```
