# Exercise 5.5.4

> Declare functions that for ABC-trees yield the infix linearization where both `B` and `C` are left-associative and take their arguments at the same level.
> Think of `B` and `C` as addition and subtraction.
> Give a linearization grammar first.

---

We propose the following linearization grammar:
```text
 tree  ::=  btree  |  ctree
btree  ::=  tree "B" ptree  |  ptree
ctree  ::=  tree "C" ptree  |  ptree
ptree  ::=  "A"  |  "(" tree ")"
```
The resulting linearization functions are as follows:
```ocaml
let rec tree t = match t with
  | A | B _ -> btree t (* we can process A with either btree or ctree *)
  | C _ -> ctree t
and btree t = match t with
  | B (t1, t2) -> tree t1 ^ "B" ^ ptree t2
  | _ -> ptree t
and ctree t = match t with
  | C (t1, t2) -> tree t1 ^ "C" ^ ptree t2
  | _ -> ptree t
and ptree t = match t with
  | A -> "A"
  | t -> "(" ^ tree t ^ ")"
```
The recursion graph is as follows:
```text
  +-----> tree <------+
  |       | ^ |       |
  |       | | |       |
btree <---+ | +---> ctree
  |         |         |
  |         |         |
  +-----> ptree <-----+
```
