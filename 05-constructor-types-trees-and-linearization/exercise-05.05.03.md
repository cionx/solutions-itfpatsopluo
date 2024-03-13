# Exercise 5.5.3

> Declare functions that for ABC-trees yield the infix linearization where `B` takes its arguments before `C`, both `B` and `C` are treated as left-associative syntactic operators, and `B` is accommodated with juxtaposition.

---

We have the following linearization grammar:
```text
ctree  ::=  ctree "C" btree  |  btree
btree  ::=  btree ptree  |  ptree
ptree  ::=  "A"  |  "(" ctree ")"
```
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
