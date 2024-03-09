# Exercise 5.4.1

> Declare a function linearizing AB-trees by treating $B$ as a right-associative syntactic operator.
> For instance, we want $B(A, B(A, A)) \rightsquigarrow \mathtt{"ABABA"}$.

---

We can declare the desired function as follows:
$$
  \begin{aligned}
    \mathit{tree}(A) &\coloneqq \mathtt{"A"} \,, \\
    \mathit{tree}(B(t_1, t_2)) &\coloneqq \mathit{ptree}(t_1) \wedge \mathtt{"B"} \wedge \mathit{tree}(t_2) \,, \\
    \mathit{ptree}(A) &\coloneqq \mathtt{"A"} \,, \\
    \mathit{ptree}(B)(t_1, t_2) &\coloneqq \mathtt{"("} \wedge \mathit{tree}(B(t_1, t_2)) \wedge \mathtt{")"} \,.
  \end{aligned}
$$
In OCaml code:
```ocaml
let rec tree t =
  match t with
  | A -> "A"
  | B (t1, t2) -> ptree t1 ^ "B" ^ tree t2
and ptree t =
  match t with
  | A -> "A"
  | B (_, _) -> "(" ^ tree t ^ ")"
```
