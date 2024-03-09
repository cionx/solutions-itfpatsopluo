# Exercise 6.3.2

> Declare a function that takes an AB-tree in infix linearization and returns an infix linearization of the tree as follows:
> 1. Remove redundant parentheses assuming B is left-associative.
> 2. Remove redundant parentheses assuming B is right-associative.
> 3. Translate from B left-associative to B right-associative.
> 4. Translate from B left-associative to OCaml linearization.

---

Throughout the following exercise we use the usual lexer:
```ocaml
type tree = A | B of tree * tree

type tokens = AT | BT | LP | RP

let verify c l =
  match l with
  | [] -> failwith "verify: no tokens"
  | c' :: l -> if c = c' then l else failwith "verify: wrong token"

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
    | _ -> failwith "lex: illegal character"
  in
  lex' 0 []
```



### 1.

We use the following grammar for the input infix linearization:
$$
  \begin{aligned}
    \mathit{tree}
    &\Coloneqq
    \mathit{ptree} \enspace \texttt{"B"} \enspace \mathit{ptree} \mid \mathit{ptree}
    \\
    \mathit{ptree}
    &\Coloneqq
    \texttt{"A"} \mid \texttt{"("} \enspace \mathit{tree} \enspace \texttt{")"}
  \end{aligned}
$$
This grammar treats $B$ as non-associative, but allows for extra parentheses.

To parse this input grammar, we rewrite it as follows:
$$
  \begin{aligned}
    \mathit{tree}
    &\Coloneqq
    \mathit{ptree} \enspace \mathit{tree'}
    \\
    \mathit{tree'}
    &\Coloneqq
    \texttt{"B"} \enspace \mathit{ptree} \mid \varepsilon
    \\
    \mathit{ptree}
    &\Coloneqq
    \texttt{"A"} \mid \texttt{"("} \enspace \mathit{tree} \enspace \texttt{")"}
  \end{aligned}
$$
We can then use the following parse function:
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

For linearization, we use the following linearization function, as taken from Section 5.4:
$$
  \begin{aligned}
    \mathit{tree}
    &\Coloneqq
    \texttt{"A"} \mid \mathit{tree} \enspace \texttt{"B"} \enspace \mathit{ptree}
    \\
    \mathit{ptree}
    &\Coloneqq
    \texttt{"A"} \mid \texttt{"("} \enspace \mathit{tree} \enspace \texttt{")"}
  \end{aligned}
$$
The resulting linearization function is as follows:
```ocaml
let rec left_lin_tree t = match t with
  | A -> "A"
  | B (t1, t2) -> left_lin_tree t1 ^ "B" ^ left_lin_ptree t2
and left_lin_ptree t = match t with
  | A -> "A"
  | t -> "(" ^ left_lin_tree t ^ ")"
```

Finally, we combine all steps:
```ocaml
let simplify1 s =
  left_lin_tree (fst (tree (lex s)))
```

We test the function $\mathit{simplify1}$ as follows:
```ocaml
# simplify1 "(ABA)BA";;
- : string = "ABABA"

# simplify1 "AB(ABA)";;
- : string = "AB(ABA)"
```



### 2.

The parser stays the same as in the previous part of the exercise.
We only need to change one line in the linearization function:
```ocaml
let rec right_lin_tree t = match t with
  | A -> "A"
  | B (t1, t2) -> right_lin_ptree t1 ^ "B" ^ right_lin_tree t2  (* changed *)
and right_lin_ptree t = match t with
  | A -> "A"
  | t -> "(" ^ right_lin_tree t ^ ")"

let simplify2 s =
  right_lin_tree (fst (tree (lex s)))
```



### 3.

We parse the input as left-associative as explained in Section 6.3:
```ocaml
let rec left_tree l =
  let (t, l) = left_ptree l in left_tree' t l
and left_tree' t l = match l with
  | BT :: l ->
    let (t', l) = left_ptree l in left_tree' (B (t, t')) l
  | _ -> (t, l)
and left_ptree l = match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t, l) = left_tree l in
    let l = verify RP l in
    (t, l)
  | _ -> failwith "left_tree"
```
We can now translate from left-associative to right-associative as follows:
```ocaml
let translate1 s =
  right_lin_tree (fst (left_tree (lex s)))
```



### 4.

We OCaml-linearize an AB-tree as follows:
```ocaml
let rec ocaml_lin_tree t = match t with
  | A -> "A"
  | B (t1, t2) ->
    "B (" ^ ocaml_lin_tree t1 ^ ", " ^ ocaml_lin_tree t2 ^ ")"
```
We can now translate from left-associative to OCaml-linearization as follows:
```ocaml
let translate2 s =
  ocaml_lin_tree (fst (left_tree (lex s)))
```
