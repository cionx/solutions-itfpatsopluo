# Exercise 5.5.2

> Declare functions that for ABC-trees yield the infix linearization where `B` takes its arguments before `C` and
> 1. both `B` and `C` are right-associative.
> 2. `B` is left-associative and `C` is right-associative.
> 3. neither `B` nor `C` is associative.
>
> In each case give a linearization grammar first.

---

We currently have the following linearization grammar:
```text
ctree  ::=  ctree "C" btree  |  btree
btree  ::=  btree "B" ptree  |  ptree
ptree  ::=  "A"  |  "(" ctree ")"
```
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

The following grammar treats both `B` and `C` as right-associative:
```text
ctree  ::=  btree "C" ctree  |  btree
btree  ::=  ptree "B" btree  |  ptree
ptree  ::=  "A"  |  "(" ctree ")"
```
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

The following grammar treats `B` as left-associative and `C` as right-associative:
```text
ctree  ::=  ctree "C" btree  |  btree
btree  ::=  ptree "B" btree  |  ptree
ptree  ::=  "A"  |  "(" ctree ")"
```
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

The following grammar treats both `B` and `C` as non-associative:
```text
ctree  ::=  btree "C" btree  |  btree
btree  ::=  ptree "B" ptree  |  ptree
ptree  ::=  "A"  |  "(" ctree ")"
```
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
