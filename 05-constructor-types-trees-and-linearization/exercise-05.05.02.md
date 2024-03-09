# Exercise 5.5.2

> Declare functions that for ABC-trees yield the infix linearization where $B$ takes its arguments before $C$ and
> 1. both $B$ and $C$ are right-associative.
> 2. $B$ is left-associative and $C$ is right-associative.
> 3. neither $B$ nor $C$ is associative.
>
> In each case give a linearization grammar first.

---

We currently have the following linearization grammar:
$$
  \begin{aligned}
    \mathit{ctree} &\Coloneqq \mathit{ctree} \; \mathtt{"C"} \; \mathit{btree} \mid \mathit{btree} \\
    \mathit{btree} &\Coloneqq \mathit{btree} \; \mathtt{"B"} \; \mathit{ptree} \mid \mathit{ptree} \\
    \mathit{ptree} &\Coloneqq \mathtt{"A"} \mid \mathtt{"("} \; \mathit{ctree} \; \mathtt{")"}
  \end{aligned}
$$
We also currently have the following linearization functions:
```ocaml
let rec ctree t = match t with
  | C (t1, t2) -> ctree t1 ^ "C" ^ btree t2
  | t -> btree t
and btree t = match t with
  | B (t1, t2) -> btree t1 ^ "B" ^ ptree t2
  | t -> ptree t
and ptree t = match t with
  | A -> "A"
  | t -> "(" ^ ctree t ^ ")"
```



### 1.

The following grammar treats both $B$ and $C$ as right-associative:
$$
  \begin{aligned}
    \mathit{ctree} &\Coloneqq \mathit{btree} \; \mathtt{"C"} \; \mathit{ctree} \mid \mathit{btree} \\
    \mathit{btree} &\Coloneqq \mathit{ptree} \; \mathtt{"B"} \; \mathit{btree} \mid \mathit{ptree} \\
    \mathit{ptree} &\Coloneqq \mathtt{"A"} \mid \mathtt{"("} \; \mathit{ctree} \; \mathtt{")"}
  \end{aligned}
$$
The corresponding linearization functions are as follows:
```ocaml
let rec ctree t = match t with
  | C (t1, t2) -> btree t1 ^ "C" ^ ctree t2
  | t -> btree t
and btree t = match t with
  | B (t1, t2) -> ptree t1 ^ "B" ^ btree t2
  | t -> ptree t
and ptree t = match t with
  | A -> "A"
  | t -> "(" ^ ctree t ^ ")"
```



### 2.

The following grammar treats $B$ as left-associative and $C$ as right-associative:
$$
  \begin{aligned}
    \mathit{ctree} &\Coloneqq \mathit{ctree} \; \mathtt{"C"} \; \mathit{btree} \mid \mathit{btree} \\
    \mathit{btree} &\Coloneqq \mathit{ptree} \; \mathtt{"B"} \; \mathit{btree} \mid \mathit{ptree} \\
    \mathit{ptree} &\Coloneqq \mathtt{"A"} \mid \mathtt{"("} \; \mathit{ctree} \; \mathtt{")"}
  \end{aligned}
$$
The corresponding linearization functions are as follows:
```ocaml
let rec ctree t = match t with
  | C (t1, t2) -> ctree t1 ^ "C" ^ btree t2
  | t -> btree t
and btree t = match t with
  | B (t1, t2) -> ptree t1 ^ "B" ^ btree t2
  | t -> ptree t
and ptree t = match t with
  | A -> "A"
  | t -> "(" ^ ctree t ^ ")"
```



### 3.

The following grammar treats both $B$ and $C$ as non-associative:
$$
  \begin{aligned}
    \mathit{ctree} &\Coloneqq \mathit{btree} \; \mathtt{"C"} \; \mathit{btree} \mid \mathit{btree} \\
    \mathit{btree} &\Coloneqq \mathit{ptree} \; \mathtt{"B"} \; \mathit{ptree} \mid \mathit{ptree} \\
    \mathit{ptree} &\Coloneqq \mathtt{"A"} \mid \mathtt{"("} \; \mathit{ctree} \; \mathtt{")"}
  \end{aligned}
$$
The corresponding linearization functions are as follows:
```ocaml
let rec ctree t = match t with
  | C (t1, t2) -> btree t1 ^ "C" ^ btree t2
  | t -> btree t
and btree t = match t with
  | B (t1, t2) -> ptree t1 ^ "B" ^ ptree t2
  | t -> ptree t
and ptree t = match t with
  | A -> "A"
  | t -> "(" ^ ctree t ^ ")"
```
