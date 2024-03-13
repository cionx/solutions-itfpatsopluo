# Exercise 6.3.3 (Simplified right associativity)

> The parsing grammar given in this section makes it possible to parse `B` either as a left-
> associative or a right-associative operator.
> For the case where `B` is accommodated as a right-associative operator, the rule for the auxiliary parsing function `tree'` can be simplified to:
> ```text
>   tree'  ::=  "B" tree  |  []
> ```
> Declare parsing functions for the simplified grammar.

---

We have overall the following grammar:
```text
 tree   ::=  ptree tree'
 tree'  ::=  "B" tree  |  []
ptree   ::=  "A"  |  "(" tree ")"
```
The resulting parsing function is as follows:
```ocaml
let rec tree l =
  let (t, l) = ptree l in tree' t l
and tree' t l = match l with
  | BT :: l ->
    let (t', l) = tree l in
    (B (t, t'), l)
  | _ -> (t, l)
and ptree l = match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t, l) = tree l in
    let l = verify RP l in
    (t, l)
  | _ -> failwith "ptree"
```
