# Exercise 4.5.6 (Repeating lists)

> A list is repeating if it has an element appearing at two different positions.
> For instance, $[2, 5, 3, 5]$ is repeating and $[2, 5, 3]$ is not repeating.  
> a) Declare a function testing whether a list is repeating.  
> b) Declare a function testing whether a list is non-repeating.  
> c) Declare a function that given a list $l$ yields a non-repeating list containing the same elements as $l$.

---

### a)

We can iterate over the list, and check for each element if it reappears later on:
$$
  \begin{gathered}
    \mathit{repeating} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathbb{B} \,, \\
    \begin{aligned}
      \mathit{repeating} \; [\,] &\coloneqq \mathsf{false} \,, \\
      \mathit{repeating} \enspace (x :: l) &\coloneqq \mathit{mem} \enspace x \enspace l \mathbin{||} \mathit{repeating} \enspace l
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec repeating l =
  match l with
  | [] -> false
  | x :: t -> List.mem x t || repeating t
```

### b)

We can simply negate the result of $\mathit{repeating}$:
$$
  \mathit{nonrepeating} \enspace l
  \coloneqq
  \mathit{not} \enspace (\mathit{repeating} \enspace l)
$$
In OCaml code:
```ocaml
let nonrepeating l =
  not (repeating l)
```

### c)

We can declare this function as follows:
$$
  \begin{gathered}
    \mathit{makeset} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathcal{L}(\alpha) \,, \\
    \begin{aligned}
      \mathit{makeset} \enspace [\,] \coloneqq{}& [\,] \,, \\
      \mathit{makeset} \enspace (x :: l) \coloneqq{}& \text{with } l' \coloneqq \mathit{makeset} \enspace l, \\
      {}&\text{if } \mathit{mem} \enspace x \enspace l' \text{ then } l' \text{ else } x :: l' \,.
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec makeset l =
  match l with
  | [] -> []
  | x :: l ->
    let l' = makeset l in
    if List.mem x l' then l' else x :: l'
```
