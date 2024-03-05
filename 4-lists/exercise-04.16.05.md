# Exercise 4.16.5 (Maps with memory)

> Note that lookup searches maps from left to right until it finds a pair with the given key.
> This opens up the possibility to keep previous values in the map by modifying update so that it simply appends the new key-value pair in front of the list:
> $$
>   \mathit{update} \enspace l \enspace a \enspace b := (a, b) :: l
> $$
> Redo the previous exercises for the new definition of update.
> Also define a function
> $$
>   \mathit{lookup\_all} : \forall \alpha \beta. \mathit{map} \; \alpha \; \beta \to \alpha \to \mathcal{L}(\beta)
> $$
> that yields the list of all values for a given key.

---

### Exercise 4.16.1

Our solution to this exercise remains unchanged.

### Exercise 4.16.2

The overall results don’t change, but the formulas in the argumentations become simpler.

### Exercise 4.16.3

Our solution to this exercise doesn’t change.

### Exercise 4.16.4

We now have to keep iterating over the rest of the list, even after deleting an entry:
$$
  \begin{gathered}
    \mathit{delete} : \forall \alpha \beta. \; \mathit{map} \; \alpha \; \beta \to \alpha \to \mathit{map} \; \alpha \; \beta \\
    \begin{aligned}
      \mathit{delete} \enspace [\,] \enspace a
      &\coloneqq
      [\,] \,,
      \\
      \mathit{delete} \enspace ((a', b') :: m') \enspace a
      &\coloneqq
      \text{if } a = a' \text{ then } \mathit{delete} \enspace m' \enspace a \text{ else } (a', b') :: (\mathit{delete} \enspace m' \enspace a)
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec delete m a =
  match m with
  | [] -> []
  | (a', b') :: m' ->
    let m'' = delete m' a in
    if a = a' then m'' else (a', b') :: m''
```

### $\mathit{lookup\_all}$

We can declare the function $\mathit{lookup\_all}$ as follows:
$$
  \begin{gathered}
    \mathit{lookup\_all} : \forall \alpha \beta. \; \mathit{map} \enspace \alpha \enspace \beta \to \alpha \to \mathcal{L}(\beta) \,, \\
    \begin{aligned}
      \mathit{lookup\_all} \enspace [\,] \enspace a
      &\coloneqq
      [\,] \,,
      \\
      \mathit{lookup\_all} \enspace ((a', b') :: m') \enspace a
      &\coloneqq
      \text{if } a = a' \text{ then } b' :: \mathit{lookup\_all} \; m' \; a \text{ else } \mathit{lookup\_all} \; m' \; a \,.
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec lookup_all m a =
  match m with
  | [] -> []
  | (a', b') :: m' ->
    let values' = lookup_all m' a in
    if a = a' then b' :: values' else values'
```
