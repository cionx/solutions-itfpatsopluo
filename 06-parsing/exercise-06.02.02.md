# Exercise 6.2.2

> Declare recursive descent parsers for AB-trees and linearizations as follows:
>
> 1. OCaml linearization, with and without extra parentheses.
> 2. Fully parenthesized infix linearization, with and without extra parentheses.
>
> Do the same for ABC-trees.

---



### 1: 1. for AB-trees without extra parentheses

OCaml linearization of AB-trees has the following linearization grammar:
```text
tree  ::=  "A"  |  "B" "(" tree "," tree ")"
```

We start by writing a lexer:
```ocaml
type tokens = AT | BT | LP | RP | CM

let lex s =
  let n = String.length s in
  let rec lex' i l =
    if i >= n then List.rev l
    else match String.get s i with
    | ' ' | '\t' | '\n' -> lex' (i + 1) l
    | 'A' -> lex' (i + 1) (AT :: l)
    | 'B' -> lex' (i + 1) (BT :: l)
    | '(' -> lex' (i + 1) (LP :: l)
    | ')' -> lex' (i + 1) (RP :: l)
    | ',' -> lex' (i + 1) (CM :: l)
    | _ -> failwith "lex: illegal character"
  in
  lex' 0 []
```

We can then parse the resulting list of tokens:
```ocaml
let rec parse l =
  match l with
  | AT :: l -> (A, l)
  | BT :: l ->
    let l = verify LP l in
    let (t1, l) = parse l in
    let l = verify CM l in
    let (t2, l) = parse l in
    let l = verify RP l in
    (B (t1, t2), l)
  | _ -> failwith "parse"
```



### 2: 1. for AB-trees with extra parentheses

We allow extra parentheses with the following extended syntax:
```text
tree  ::=  "A"  |  "B" "(" tree "," tree ")"  |  "(" tree ")"
```
We only need to extend the `parser` function by the following lines:
```ocaml
  | LP :: l ->
    let (t, l) = parse l in
    let l = verify RP l in
    (t, l)
```

It should be noted that OCaml actually allows for even more extra parentheses.
For example, the string `"B((A, A))"` is not contained our above grammar, but is accepted by OCaml.
We don’t know how to write a parser that also allows this kind of extra parentheses.
(As an example, both `"B((A, A))"` and `"B((A), A)` begin with `"B(("`.
But our recursive parser needs to somehow know which pattern to use to parse the rest of string.)



### 3: 1. for ABC-trees without extra parentheses

We now have the following grammar:
```text
tree  ::=  "A"
        |  "B" "(" tree "," tree ")"
        |  "C" "(" tree "," tree ")"
```
We only have to extend our lexer and parser:
```ocaml
type tree = A | B of tree * tree | C of tree * tree

type tokens = AT | BT | CT | LP | RP | CM

let lex s =
  let n = String.length s in
  let rec lex' i l =
    if i >= n then List.rev l
    else match String.get s i with
    | ' ' | '\t' | '\n' -> lex' (i + 1) l
    | 'A' -> lex' (i + 1) (AT :: l)
    | 'B' -> lex' (i + 1) (BT :: l)
    | 'C' -> lex' (i + 1) (CT :: l)
    | '(' -> lex' (i + 1) (LP :: l)
    | ')' -> lex' (i + 1) (RP :: l)
    | ',' -> lex' (i + 1) (CM :: l)
    | _ -> failwith "lex: illegal character"
  in
  lex' 0 []

let rec parse l =
  let two_args l =
    let l = verify LP l in
    let (t1, l) = parse l in
    let l = verify CM l in
    let (t2, l) = parse l in
    let l = verify RP l in
    (t1, t2, l)
  in
  match l with
  | AT :: l -> (A, l)
  | BT :: l ->
    let (t1, t2, l) = two_args l in
    (B (t1, t2), l)
  | CT :: l ->
    let (t1, t2, l) = two_args l in
    (C (t1, t2), l)
  | _ -> failwith "parse"
```



### 4: 1. for ABC-trees with extra parentheses

Similar to before, we now use the extended grammar
```text
tree  ::=  "A"
        |  "B" "(" tree "," tree ")"
        |  "C" "(" tree "," tree ")"
        |  "(" tree ")"
```
As before, we only need to extend the function `parse` by the following lines:
```ocaml
  | LP :: l ->
    let (t, l) = parse l in
    let l = verify RP l in
    (t, l)
```



### 5: 2. for AB-trees without extra parentheses

The grammar for fully parentheses infix notation for AB-trees is as follows:
```text
tree  ::=  "A"  |  "(" tree "B" tree ")"
```
We can use the same lexer as before, and the following parser:
```ocaml
let rec parse l =
  match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t1, l) = parse l in
    let l = verify BT l in
    let (t2, l) = parse l in
    let l = verify RP l in
    (B (t1, t2), l)
  | _ -> failwith "parse"
```



### 6: 2. for AB-trees with extra parentheses

We can use the following grammar:
```text
 tree  ::=  ptree "B" ptree  |  ptree
ptree  ::=  "A"  |  "(" tree ")"
```
This grammar has a problem:
we cannot tell apart the two construction rules `tree "B" ptree` and `ptree` by looking at only a fixed number of beginning tokens.
Motivated by the upcoming Section 6.3 we therefore use the following modified grammar:
```text
 tree   ::=  ptree tree'
ptree   ::=  "B" ptree | []
ptree'  ::=  "A" | "(" tree ")"
```
We also model the parser according to Section 6.3:
```ocaml
let rec tree l =
  let (t, l) = ptree l in tree' t l
and tree' t l = match l with
  | BT :: l ->
    let (t', l) = ptree l in
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



### 7: 2. for ABC-trees without extra parentheses

The grammar for fully parentheses infix notation for ABC-trees is as follows:
```text
tree  ::=  "A"
        |  "(" tree "B" tree ")"
        |  "(" tree "C" tree ")"
```
We again have the problem that the two production rules `"(" tree "B" tree ")"` and `"(" tree "C" tree ")"` cannot be told apart by looking at only a fixed number of initial tokens.
We therefore use the following modified grammar instead:
```text
tree   ::=  "A"  |  "(" tree tree'
tree'  ::=  "B" tree ")"  |  "C" tree ")"
```
We can parse this grammar as follows:
```ocaml
let rec tree l = match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t1, l) = tree l in tree' t1 l
  | _ -> failwith "tree"
and tree' t1 l = match l with
  | BT :: l ->
    let (t2, l) = tree l in
    let l = verify RP l in
    (B (t1, t2), l)
  | CT :: l ->
    let (t2, l) = tree l in
    let l = verify RP l in
    (C (t1, t2), l)
  | _ -> failwith "tree'"
```



### 8: 2. for ABC-trees with extra parentheses

We can use the following grammar:
```
 tree  ::=  ptree "B" ptree
         |  ptree "C" ptree
         |  ptree
ptree  ::=  "A"  |  "(" tree ")"
```
As before, we rewrite this grammar as follows:
```text
 tree   ::=  ptree tree'
 tree'  ::=  "B" ptree  |  "C" ptree  |  []
ptree   ::=  "A"  |  "(" tree ")"
```
We can write a parser for this modified grammar as follows:
```ocaml
let rec tree l =
  let (t, l) = ptree l in tree' t l
and tree' t l = match l with
  | BT :: l ->
    let (t', l) = ptree l in
    (B (t, t'), l)
  | CT :: l ->
    let (t', l) = ptree l in
    (C (t, t'), l)
  | _ -> (t, l)
and ptree l = match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t, l) = tree l in
    let l = verify RP l in
    (t, l)
  | _ -> failwith "ptree"
```
