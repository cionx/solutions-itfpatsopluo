# Exercise 5.5.1

> Declare functions that for ABC-trees yield
> 1. the prefix linearization.
> 2. the postfix linearization.
> 3. the fully parenthesized infix linearization.

---

### 1.

We can declare the function $\mathit{prefix}$ as follows:
$$
  \begin{gathered}
    \mathit{prefix} : \mathit{tree} \to \mathit{string} \,, \\
    \begin{aligned}
      \mathit{prefix}(A) &\coloneqq \mathtt{"A"} \,, \\
      \mathit{prefix}(B(t_1, t_2)) &\coloneqq \mathtt{"B"} \wedge \mathit{prefix}(t_1) \wedge \mathit{prefix}(t_2) \,, \\
      \mathit{prefix}(C(t_1, t_2)) &\coloneqq \mathtt{"C"} \wedge \mathit{prefix}(t_1) \wedge \mathit{prefix}(t_2) \,.
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec prefix t =
  match t with
  | A -> "A"
  | B (t1, t2) -> "B" ^ (prefix t1) ^ (prefix t2)
  | C (t1, t2) -> "C" ^ (prefix t1) ^ (prefix t2)
```

### 2.

We can declare the function $\mathit{postfix}$ as follows:
$$
  \begin{gathered}
    \mathit{postfix} : \mathit{tree} \to \mathit{string} \,, \\
    \begin{aligned}
      \mathit{postfix}(A) &\coloneqq \mathtt{"A"} \,, \\
      \mathit{postfix}(B(t_1, t_2)) &\coloneqq \mathit{postfix}(t_1) \wedge \mathit{postfix}(t_2) \wedge \mathtt{"B"} \,, \\
      \mathit{postfix}(C(t_1, t_2)) &\coloneqq \mathit{postfix}(t_1) \wedge \mathit{postfix}(t_2) \wedge \mathtt{"C"} \,.
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec postfix t =
  match t with
  | A -> "A"
  | B (t1, t2) -> (postfix t1) ^ (postfix t2) ^ "B"
  | C (t1, t2) -> (postfix t1) ^ (postfix t2) ^ "C"
```

### 3.

We can declare the function $\mathit{infix}$ as follows:
$$
  \begin{gathered}
    \mathit{infix} : \mathit{tree} \to \mathit{string} \,, \\
    \begin{aligned}
      \mathit{infix}(A) &\coloneqq \mathtt{"A"} \,, \\
      \mathit{infix}(B(t_1, t_2)) &\coloneqq \mathtt{"("} \wedge \mathit{infix}(t_1) \wedge \mathtt{"B"} \wedge \mathit{infix}(t_2) \wedge \mathtt{")"} \,, \\
      \mathit{infix}(C(t_1, t_2)) &\coloneqq \mathtt{"("} \wedge \mathit{infix}(t_1) \wedge \mathtt{"C"} \wedge \mathit{infix}(t_2) \wedge \mathtt{")"} \,, \\
    \end{aligned}
  \end{gathered}
$$
In OCaml code:
```ocaml
let rec infix t =
  match t with
  | A -> "A"
  | B (t1, t2) -> "(" ^ (infix t1) ^ "B" ^ (infix t2) ^ ")"
  | C (t1, t2) -> "(" ^ (infix t1) ^ "C" ^ (infix t2) ^ ")"
```
