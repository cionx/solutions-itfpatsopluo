# Exercise 5.5.3

> Declare functions that for ABC-trees yield the infix linearization where $B$ takes its arguments before $C$, both $B$ and $C$ are treated as left-associative syntactic operators, and $B$ is accommodated with juxtaposition.

---

We have the following linearization grammar:
$$
  \begin{aligned}
    \mathit{ctree} &\Coloneqq \mathit{ctree} \; \mathtt{"C"} \; \mathit{btree} \mid \mathit{btree} \\
    \mathit{btree} &\Coloneqq \mathit{btree} \; \mathit{ptree} \mid \mathit{ptree} \\
    \mathit{ptree} &\Coloneqq \mathtt{"A"} \mid \mathtt{"("} \; \mathit{ctree} \; \mathtt{")"}
  \end{aligned}
$$
The corresponding linearization functions are as follows:
```ocaml
let rec ctree t = match t with
  | C (t1, t2) -> ctree t1 ^ "C" ^ btree t2
  | t -> btree t
and btree t = match t with
  | B (t1, t2) -> btree t1 ^ ptree t2
  | t -> ptree t
and ptree t = match t with
  | A -> "A"
  | t -> "(" ^ ctree t ^ ")"
```
