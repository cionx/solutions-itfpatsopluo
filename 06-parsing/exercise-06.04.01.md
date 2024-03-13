# Exercise 6.4.1

> Declare parsers for ABC-trees and infix linearizations where `B` takes arguments before `C`, `C` is left-associative, and
> 1. `B` is left-associative.
> 2. `B` is right-associative.
> 3. `B` is realized with left-associative juxtaposition.
> 4. `B` is realized with right-associative juxtaposition.

---



### 1.

The parser looks as follows:
```ocaml
let rec tree1 l =
  let (t, l) = btree1 l in tree1' t l
and tree1' t l = match l with
  | CT ::l ->
    let (t', l) = btree1 l in tree1' (C (t, t')) l
  | _ -> (t, l)
and btree1 l =
  let (t, l) = ptree1 l in btree1' t l
and btree1' t l = match l with
  | BT :: l ->
    let (t', l) = ptree1 l in btree1' (B (t, t')) l
  | _ -> (t, l)
and ptree1 l = match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t, l) = tree1 l in
    let l = verify RP l in
    (t, l)
  | _ -> failwith "ptree1"
```



### 2.

The parser looks as follows:
```ocaml
let rec tree2 l =
  let (t, l) = btree2 l in tree2' t l
and tree2' t l = match l with
  | CT :: l ->
    let (t', l) = btree2 l in tree2' (C (t, t')) l
  | _ -> (t, l)
and btree2 l =
  let (t, l) = ptree2 l in btree2' t l
and btree2' t l = match l with
  | BT :: l ->
    let (t', l) = ptree2 l in
    let (t'', l) = btree2' t' l in
    (B (t, t''), l)
  | _ -> (t, l)
and ptree2 l = match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t, l) = tree2 l in
    let l = verify RP l in
    (t, l)
  | _ -> failwith "ptree2"
```



### 3.

We only have to extend the declaration of `btree'` by a new case:
```ocaml
let rec tree3 l =
  let (t, l) = btree3 l in tree3' t l
and tree3' t l = match l with
  | CT ::l ->
    let (t', l) = btree3 l in tree3' (C (t, t')) l
  | _ -> (t, l)
and btree3 l =
  let (t, l) = ptree3 l in btree3' t l
and btree3' t l = match l with
  | BT :: l ->
    let (t', l) = ptree3 l in btree3' (B (t, t')) l
  | AT :: _ | LP :: _ ->                              (* new case *)
    let (t', l) = ptree3 l in btree3' (B (t, t')) l
  | _ -> (t, l)
and ptree3 l = match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t, l) = tree3 l in
    let l = verify RP l in
    (t, l)
  | _ -> failwith "ptree3"
```



### 4.

As before, we only need to extend the declaration of `btree'` by an additional case:
```ocaml
let rec tree4 l =
  let (t, l) = btree4 l in tree4' t l
and tree4' t l = match l with
  | CT :: l ->
    let (t', l) = btree4 l in tree4' (C (t, t')) l
  | _ -> (t, l)
and btree4 l =
  let (t, l) = ptree4 l in btree4' t l
and btree4' t l = match l with
  | BT :: l ->
    let (t', l) = ptree4 l in
    let (t'', l) = btree4' t' l in
    (B (t, t''), l)
  | AT :: _ | LP :: _ ->            (* new case *)
    let (t', l) = ptree4 l in
    let (t'', l) = btree4' t' l in
    (B (t, t''), l)
  | _ -> (t, l)
and ptree4 l = match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t, l) = tree4 l in
    let l = verify RP l in
    (t, l)
  | _ -> failwith "ptree4"
```
