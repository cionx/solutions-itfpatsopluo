# Exercise 4.16.6 (Maps as functions)

> Maps can be realized with functions if all maps are constructed from the empty map
> $$
>   \mathit{empty} : \forall \alpha \beta. \mathit{map} \enspace \alpha \enspace \beta
> $$
> with update and the only thing that matters is that lookup yields the
> correct results. Assume the definition
> $$
>   \mathit{map} \enspace \alpha \enspace \beta \coloneqq \alpha \to \mathsf{Some} \enspace \beta
> $$
> and define empty and the operations update and lookup accordingly.
> Test your solution with
> $$
>   \mathit{lookup} \enspace (\mathit{update} \enspace (\mathit{update} \enspace (\mathit{update} \enspace \mathit{empty} \enspace \mathtt{"y"} \enspace 7) \enspace \mathtt{"x"} \enspace 2) \enspace \mathtt{"y"} \enspace 5) \enspace \mathtt{"y"} = \mathsf{Some} \enspace 5
> $$
> Note that you can still define the operations bound and delete from Exercises 4.16.1 and 4.16.2.

---

We represent a map of type $\mathit{map} \; \alpha \; \beta$ as a function $m$ of type $\alpha \to \mathcal{O}(\beta)$ such that $m \; a$ is the value associated to the key $a$.
If no such value exists, then $\mathsf{None}$ is returned instead.

The empty map is therefore the function that returns $\mathsf{None}$ for every input:
$$
  \begin{gathered}
    \mathit{empty} \colon \forall \alpha \beta. \; \alpha \to \mathcal{O}(\beta) \,, \\
    \mathit{empty} \enspace a \coloneqq \mathsf{None} \,.
  \end{gathered}
$$
In OCaml code:
```ocaml
let empty _ =
  None
```

Looking up a value is done by function evaluation:
$$
  \begin{gathered}
    \mathit{lookup} \colon \forall \alpha \beta. \; \mathit{map} \; \alpha \; \beta \to \alpha \to \mathcal{O}(\beta) \,, \\
    \mathit{lookup} \enspace m \enspace a \coloneqq m \enspace a \,.
  \end{gathered}
$$
In OCaml code:
```ocaml
let lookup m a =
  m a
```

We can update a map with a new binding as follows:
$$
  \begin{gathered}
    \mathit{update} \colon \forall \alpha \beta. \; \mathit{map} \; \alpha \; \beta \to \alpha \to \beta \to \mathit{map} \; \alpha \; \beta \,, \\
    (\mathit{update} \enspace m \enspace a \enspace b) \enspace a'
    \coloneqq
    \text{if } a = a' \text{ then } \mathsf{Some} \; b \text{ else } m \; a' \,.
  \end{gathered}
$$
In OCaml code:
```ocaml
let update m a b a' =
  if a = a' then Some b else m a'
```

We can now test the given example in utop:
```ocaml
# let m = update (update (update empty "y" 7) "x" 2) "y" 5;;
val t : string -> int option = <fun>

# lookup m "y";;
- : int option = Some 5
```
