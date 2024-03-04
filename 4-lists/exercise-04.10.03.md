# Exercise 4.10.3 (Splits)

> Given a list $l = l_1 \mathbin{@} l_2$, we call the pair $(l_1, l_2)$ a **split** of $l$. 
> Declare a function that yields a list containing all splits of a list.

---

We first declare an auxiliary function $\mathit{splits}'$ as follows:
$$
  \begin{gathered}
    \mathit{splits'} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathcal{L}(\alpha) \to \mathcal{L}(\mathcal{L}(\alpha) \times \mathcal{L}(\alpha)) \to \mathcal{L}(\mathcal{L}(\alpha) \times \mathcal{L}(\alpha)) \,, \\
    \begin{aligned}
      \mathit{splits'} \enspace l_1 \enspace [\,] \enspace \mathit{acc}
      &\coloneqq
      ( \mathit{rev} \enspace l_1, [\,] ) :: \mathit{acc} \,,\\
      \mathit{splits'} \enspace l_1 \enspace (x :: l) \enspace \mathit{acc}
      &\coloneqq
      \mathit{splits'} \enspace (x :: l_1) \enspace l \enspace ((\mathit{rev} \enspace l_1, x :: l) :: \mathit{acc})
    \end{aligned}
  \end{gathered}
$$
In the call $\mathit{splits}' \enspace l_1 \enspace l_2 \enspace \mathit{acc}$, the arguments have the following roles:
- $\mathit{acc}$ keeps track of the splits we have constructed so far.
- $l_1$ is the left part of the next split, saved in reversed order.
- $l_2$ is the right side of the next split.

In each iteration we are moving the leading element of the right side to the end of the left side.

We can now declare the function $\mathit{splits}$ as follows:
$$
  \begin{gathered}
    \mathit{splits} : \forall \alpha. \; \mathcal{L}(\alpha) \to \mathcal{L}(\mathcal{L}(\alpha) \times \mathcal{L}(\alpha)) \,, \\
    \begin{aligned}
      \mathit{splits} \enspace l
      &\coloneqq
      \mathit{splits}' \enspace [\,] \enspace l  \enspace [\,] \,.
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec splits' l1 l2 acc =
  match l2 with
  | [] -> (List.rev l1, []) :: acc
  | x :: l -> splits' (x :: l1) l ((List.rev l1, l2) :: acc)

let splits l =
  splits' [] l []
```

Our implementation seems to work:
```ocaml
# splits [1; 2; 3];;
- : (int list * int list) list =
[([1; 2; 3], []); ([1; 2], [3]); ([1], [2; 3]); ([], [1; 2; 3])]
```
