# Exercise 6.6.3 (Project)

> Realize a lexer, a parser, and a linearizer for Mini-OCaml.
> Check that parsing after linearization takes you back to the tree you started with, and that parsing followed by linearization gives you an equivalent string.
> Extent Mini-OCaml with pair expressions $(e_1 , e_2)$ and the accompanying projections.

---

## Types

We use the following types for tokens and expressions:
```ocaml
type var = string
type con = Bcon of bool | Icon of int
(** Tokens. *)
type token =
  | TkAdd | TkSub | TkMul | TkLP | TkRP | TkEq | TkLeq | TkArr
  | TkVar of string | TkCon of con
  | TkIf | TkThen | TkElse | TkLam | TkLet | TkIn | TkRec
(** Expressions. *)
type op = EAdd | ESub | EMul | ELeq
type exp =
  | EVar of var
  | ECon of con
  | EOapp of op * exp * exp
  | EFapp of exp * exp
  | EIf of exp * exp * exp
  | ELam of var * exp
  | ELet of var * exp * exp
  | ELetrec of var * var * exp * exp
```



## Lexing

We will use an auxiliary function to help us parse numbers and identifiers:
```ocaml
(** [howmany p s start] is how many characters in [s] satisfy [p], starting at
    index [start]. *)
let howmany p s start =
  let n = String.length s in
  let rec helper i =
    if i < n && p (String.get s i) then helper (i + 1) else i
  in
  (helper start) - start
```
We use the following tests for digits and identifier characters:
```ocaml
(** [digit c] is whether [c] is a character in range ['0', ..., '9']. *)
let digit c =
  '0' <= c && c <= '9'

(** [lowercase c] is whether [c] is a character in range ['a', ..., 'z']. *)
let lowercase c =
  'a' <= c && c <= 'z'

(** [uppercase c] is whether [c] is a character in range ['A', ..., 'Z']. *)
let uppercase c =
  'A' <= c && c <= 'Z'

(** [identifier_char c] is whether [c] is a valid identifier character: a digit,
    a lowercase latter, an uppercase letter, or an underscore. *)
let identifier_char c =
  digit c || lowercase c || uppercase c || c = '_'
```
We convert a string of digits into an integer as follows:
```ocaml
(** [int_of_digit c] is the numerical value of a character ['0', ..., '9']. *)
let int_of_digit c =
  Char.code c - Char.code '0'

let int_of_string s =
  let n = String.length s in
  let rec helper i acc =
    if i >= n then acc
    else
      let c = String.get s i in
      helper (i + 1) (10 * acc + int_of_digit c)
  in
  helper 0 0
```

Finally, the lexing function:
```ocaml
let lex s =
  let n = String.length s in
  let rec lex' i l =
    if i >= n then List.rev l
    else match String.get s i with
      (* a) skip whitespace *)
      | ' ' | '\t' | '\n' -> lex' (i + 1) l
      (* b) simple characters *)
      | '+' -> lex' (i + 1) (TkAdd :: l)
      | '*' -> lex' (i + 1) (TkMul :: l)
      | '=' -> lex' (i + 1) (TkEq :: l)
      | '(' -> lex' (i + 1) (TkLP :: l)
      | ')' -> lex' (i + 1) (TkRP :: l)
      (* c) character '<' *)
      | '<' ->
        if i < n - 1 && String.get s (i + 1) == '='
        then lex' (i + 2) (TkLeq :: l)
        else failwith "lex: illegal character after '<'"
      (* d) character '-' *)
      | '-' ->
        if i < n - 1 && String.get s (i + 1) == '>'
        then lex' (i + 2) (TkArr :: l)
        else lex' (i + 1) (TkSub :: l)
      (* e) digits *)
      | '0'..'9' ->
        let len = howmany digit s i in
        let num = int_of_string (String.sub s i len) in
        lex' (i + len) ((TkCon (Icon num)) :: l)
      (* f) identifiers *)
      | 'a'..'z' ->
        let len = howmany identifier_char s i in
        let id = String.sub s i len in
        let tk = begin match id with
          (* f.i. structure keywords *)
          | "if" -> TkIf
          | "then" -> TkThen
          | "else" -> TkElse
          | "fun" -> TkLam
          | "let" -> TkLet
          | "in" -> TkIn
          | "rec" -> TkRec
          (* f.ii. boolean constants *)
          | "true" -> TkCon (Bcon true)
          | "false" -> TkCon (Bcon false)
          (* f.iii. variable names *)
          | id -> TkVar id
          end
        in lex' (i + len) (tk :: l)
      | _ -> failwith "lex: illegal character"
  in
  lex' 0 []
```



## Parsing

We are given the following grammar for parsing:
$$
  \begin{aligned}
    \mathit{exp}
    \Coloneqq{}&
    \texttt{"if"} \enspace \mathit{exp} \enspace \texttt{"then"} \enspace \mathit{exp} \enspace \texttt{"else"} \enspace \mathit{exp}
    \\
    \mid{}&
    \texttt{"fun"} \enspace \mathit{var} \enspace \texttt{"->"} \enspace \mathit{exp}
    \\
    \mid{}&
    \texttt{"let"} \enspace \mathit{var} \enspace \texttt{"="} \enspace \mathit{exp} \enspace \texttt{"in"} \enspace \mathit{exp}
    \\
    \mid{}&
    \texttt{"let rec"} \enspace \mathit{var} \enspace \mathit{var} \enspace \texttt{"="} \enspace \mathit{exp} \enspace \texttt{"in"} \enspace \mathit{exp}
    \\
    \mid{}&
    \mathit{cexp}
    \\
    \mathit{cexp}
    \Coloneqq{}&
    \mathit{sexp} \enspace \mathit{cexp'}
    \\
    \mathit{cexp'}
    \Coloneqq{}&
    \texttt{"<="} \enspace \mathit{sexp} \mid [\,]
    \\
    \mathit{sexp}
    \Coloneqq{}&
    \mathit{mexp} \enspace \mathit{sexp'}
    \\
    \mathit{sexp'}
    \Coloneqq{}&
    \texttt{"+"} \enspace \mathit{mexp} \enspace \mathit{sexp'}
    \mid \texttt{"-"} \enspace \mathit{mexp} \enspace \mathit{sexp'}
    \mid [\,]
    \\
    \mathit{mexp}
    \Coloneqq{}&
    \mathit{aexp} \enspace \mathit{mexp'}
    \\
    \mathit{mexp'}
    \Coloneqq{}&
    \texttt{"*"} \enspace \mathit{aexp} \enspace \mathit{mexp'}
    \mid [\,]
    \\
    \mathit{aexp}
    \Coloneqq{}&
    \mathit{pexp} \enspace \mathit{aexp'}
    \\
    \mathit{aexp'}
    \Coloneqq{}&
    \mathit{pexp} \enspace \mathit{aexp'}
    \mid [\,]
    \\
    \mathit{pexp}
    \Coloneqq{}&
    \mathit{var} \mid \mathit{con} \mid \texttt{"("} \enspace \mathit{exp} \enspace \texttt{")"}
  \end{aligned}
$$
Addition, multiplication, subtraction, and application are all supposed to be parsed left-associatively.

This grammar and these left-associativities lead us to the following parsing function:
```ocaml
let verify c l =
  match l with
  | [] -> failwith "verify: no token"
  | c' :: l -> if c = c' then l else failwith "verify: wrong token"

let rec exp l = match l with
  | TkIf :: l ->
    let (e1, l) = exp l in
    let l = verify TkThen l in
    let (e2, l) = exp l in
    let l = verify TkElse l in
    let (e3, l) = exp l in
    (EIf (e1, e2, e3), l)
  | TkLam :: (TkVar x) :: TkArr:: l ->
    let (t, l) = exp l in
    (ELam (x, t), l)
  | TkLet :: (TkVar x) :: TkEq :: l ->
    let (e1, l) = exp l in
    let l = verify TkIn l in
    let (e2, l) = exp l in
    (ELet (x, e1, e2), l)
  | TkLet :: TkRec :: (TkVar f) :: (TkVar x) :: TkEq :: l ->
    let (e1, l) = exp l in
    let l = verify TkIn l in
    let (e2, l) = exp l in
    (ELetrec (f, x, e1, e2), l)
  | l -> cexp l
and cexp l =
  let (e, l) = sexp l in cexp' e l
and cexp' e l = match l with
  | TkLeq :: l ->
    let (e', l) = sexp l in (EOapp (ELeq, e, e'), l)
  | _ -> (e, l)
and sexp l =
  let (e, l) = mexp l in sexp' e l
and sexp' e l = match l with
  | TkAdd :: l ->
    let (e', l) = mexp l in sexp' (EOapp (EAdd, e, e')) l
  | TkSub :: l ->
    let (e', l) = mexp l in sexp' (EOapp (ESub, e, e')) l
  | _ -> (e, l)
and mexp l =
  let (e, l) = aexp l in mexp' e l
and mexp' e l = match l with
  | TkMul :: l ->
    let (e', l) = aexp l in mexp' (EOapp (EMul, e, e')) l
  | _ -> (e, l)
and aexp l =
  let (e, l) = pexp l in aexp' e l
and aexp' e l = match l with
  | (TkVar _) :: _ | (TkCon _) :: _ | TkLP :: _ ->
    let (e', l) = pexp l in aexp' (EFapp (e, e')) l
  | _ -> (e, l)
and pexp l = match l with
  | (TkVar x) :: l -> (EVar x,  l)
  | (TkCon c) :: l -> (ECon c, l)
  | TkLP :: l ->
    let (e, l) = exp l in
    let l = verify TkRP l in
    (e, l)
  | _ -> failwith "parse"
```



## Linearization

We can reuse our solution from Exercise 5.6.2:

We use the following linearization grammar:
$$
  \begin{aligned}
    \mathit{exp} \Coloneqq{}& \texttt{"if"} \enspace \mathit{exp} \enspace \texttt{"then"} \enspace \mathit{exp} \enspace \texttt{"else"} \enspace \mathit{exp} \\
    \mid{}& \texttt{"fun"} \enspace \mathit{var} \enspace \texttt{"->"} \enspace \mathit{exp} \\
    \mid{}& \texttt{"let"} \enspace \mathit{var} \enspace \texttt{"="} \enspace \mathit{exp} \enspace \texttt{"in"} \enspace \mathit{exp} \\
    \mid{}& \texttt{"let rec"} \enspace \mathit{var} \enspace \mathit{var} \enspace \texttt{"="} \enspace \mathit{exp} \enspace \texttt{"in"} \enspace \mathit{exp} \\
    \mid{}& \mathit{cexp} \\
    \mathit{cexp} \Coloneqq{}& \mathit{sexp} \enspace \texttt{"<="} \enspace \mathit{sexp} \mid \mathit{sexp} \\
    \mathit{sexp} \Coloneqq{}& \mathit{sexp} \enspace \texttt{"+"} \enspace \mathit{mexp} \mid \mathit{sexp} \enspace \texttt{"-"} \enspace \mathit{mexp} \mid \mathit{mexp} \\
    \mathit{mexp} \Coloneqq{}& \mathit{mexp} \enspace \texttt{"*"} \enspace \mathit{aexp} \mid \mathit{aexp} \\
    \mathit{aexp} \Coloneqq{}& \mathit{aexp} \enspace \mathit{pexp} \mid \mathit{pexp} \\
    \mathit{pexp} \Coloneqq{}& \mathit{var} \mid \mathit{con} \mid \texttt{"("} \enspace \mathit{exp} \enspace \texttt{")"}
  \end{aligned}
$$
The resulting linearization function is as follows:
```ocaml
let string_of_bool b =
  match b with
  | true -> "true"
  | false -> "false"

let digit_of_int i =
  Char.chr (i + Char.code '0')

let string_of_int i =
  let rec helper i acc =
    if i = 0 then acc
    else
      helper (i / 10) (String.make 1 (digit_of_int (i mod 10)) ^ acc)
  in
  if i = 0 then "0"
  else if i < 0 then "-" ^ (string_of_int (-i))
  else helper i ""

let rec lin_exp e = match e with
  | EIf (e1, e2, e3) ->
    "if " ^ lin_exp e1 ^ " then " ^ lin_exp e2 ^ " else " ^ lin_exp e3
  | ELam (x, e) ->
    "fun " ^ x ^ " -> " ^ lin_exp e
  | ELet (x, e1, e2) ->
    "let " ^ x ^ " = " ^ lin_exp e1 ^ " in " ^ lin_exp e2
  | ELetrec (f, x, e1, e2) ->
    "let rec " ^ f ^ " " ^ x ^ " = " ^ lin_exp e1 ^ " in " ^ lin_exp e2
  | e -> lin_cexp e
and lin_cexp e = match e with
  | EOapp (ELeq, e1, e2) ->
    lin_sexp e1 ^ " <= " ^ lin_sexp e2
  | e -> lin_sexp e
and lin_sexp e = match e with
  | EOapp (EAdd, e1, e2) ->
    lin_sexp e1 ^ " + " ^ lin_mexp e2
  | EOapp (ESub, e1, e2) ->
    lin_sexp e1 ^ " - " ^ lin_mexp e2
  | e -> lin_mexp e
and lin_mexp e = match e with
  | EOapp (EMul, e1, e2) ->
    lin_mexp e1 ^ " * " ^ lin_aexp e2
  | e -> lin_aexp e
and lin_aexp e = match e with
  | EFapp (e1, e2) ->
    lin_aexp e1 ^ " " ^ lin_pexp e2
  | e -> lin_pexp e
and lin_pexp e = match e with
  | EVar x -> x
  | ECon (Bcon b) -> string_of_bool b
  | ECon (Icon i) -> string_of_int i
  | e -> "(" ^ lin_exp e ^ ")"
```





## Pairs

### Lexing

We start by adding a new token `TkCom` for commas, as well as tokens `TkFst` and `TkSnd` for the projection keywords:
```ocaml
type token =
  | TkAdd | TkSub | TkMul | TkLP | TkRP | TkEq | TkCom | TkLeq | TkArr
  | TkVar of string | TkCon of con
  | TkIf | TkThen | TkElse | TkFst | TkSnd | TkLam | TkLet | TkIn | TkRec
```
We then extend the lexer to handle this new token:
```ocaml
      ⋮
      | ')' -> lex' (i + 1) (TkRP :: l)
      | ',' -> lex' (i + 1) (TkCom :: l)
      ⋮

          ⋮
          | "rec" -> TkRec
          | "fst" -> TkFst
          | "snd" -> TkSnd
          ⋮
```

### Parsing

We extend the type `exp` with pairs and projections:
```ocaml
  ⋮
  | ECon of con
  | EPair of exp * exp
  | EFst of exp
  | ESnd of exp
  | EOapp of op * exp * exp
  ⋮
```

For parsing we extend the rule $\mathit{aexp}$ to handle projections, and we extend the rule $\mathit{pexp}$ to handle pairs:
$$
  \begin{aligned}
    \vdots\quad{}&
    \\
    \mathit{aexp}
    \Coloneqq{}&
    \texttt{"fst"} \enspace \mathit{pexp} \enspace \mathit{aexp'}
    \mid \texttt{"snd"} \enspace \mathit{pexp} \enspace \mathit{aexp'}
    \mid \mathit{pexp} \enspace \mathit{aexp'}
    \\
    \vdots\quad{}&
    \\
    \mathit{pexp}
    \Coloneqq{}&
    \mathit{var}
    \mid \mathit{con}
    \mid \texttt{"("} \enspace \mathit{exp} \enspace \texttt{")"}
    \mid \texttt{"("} \enspace \mathit{exp} \enspace \texttt{","} \enspace \mathit{exp} \enspace \texttt{")"}
  \end{aligned}
$$
For parsing purposes we rewrite this extended version of $\mathit{pexp}$ as follows:
$$
  \begin{aligned}
    \mathit{pexp}
    \Coloneqq{}&
    \mathit{var}
    \mid \mathit{con}
    \mid \texttt{"("} \enspace \mathit{exp} \enspace \mathit{pexp'}
    \\
    \mathit{pexp'}
    \Coloneqq{}&
    \texttt{")"}
    \mid \texttt{","} \enspace \mathit{exp} \enspace \texttt{")"}
  \end{aligned}
$$
The corresponding changes in the parsing function look as follows:
```ocaml
⋮
and aexp l = match l with
  | TkFst :: l -> let (e, l) = pexp l in aexp' (EFst e) l
  | TkSnd :: l ->  let (e, l) = pexp l in aexp' (ESnd e) l
  | l -> let (e, l) = pexp l in aexp' e l
⋮
and pexp l = match l with
  | (TkVar x) :: l -> (EVar x,  l)
  | (TkCon c) :: l -> (ECon c, l)
  | TkLP :: l ->
    let (e, l) = exp l in pexp' e l
  | _ -> failwith "parse"
and pexp' e l = match l with
  | TkRP :: l -> (e, l)
  | TkCom :: l ->
    let (e', l) = exp l in
    let l = verify TkRP l in
    (EPair (e, e'), l)
  | _ -> failwith "parse"
```

### Linearization

We modify the linearization grammar as follows:
$$
  \begin{aligned}
    \vdots\quad{}&
    \\
    \mathit{aexp}
    \Coloneqq{}&
    \texttt{"fst"} \enspace \mathit{pexp}
    \mid \texttt{"snd"} \enspace \mathit{pexp}
    \mid \mathit{aexp} \enspace \mathit{pexp}
    \mid \mathit{pexp}
    \\
    \mathit{pexp}
    \Coloneqq{}&
    \mathit{var}
    \mid \mathit{con}
    \mid \texttt{"("} \enspace \mathit{exp} \enspace \texttt{","} \enspace \mathit{exp} \enspace \texttt{")"}
    \mid \texttt{"("} \enspace \mathit{exp} \enspace \texttt{")"}
  \end{aligned}
$$
The changes to the linearization function are then as follows:
```ocaml
and lin_aexp e = match e with
  | EFst e ->
    "fst " ^ lin_pexp e
  | ESnd e ->
    "fst " ^ lin_pexp e
  | EFapp (e1, e2) ->
    lin_aexp e1 ^ " " ^ lin_pexp e2
  | e -> lin_pexp e
and lin_pexp e = match e with
  | EVar x -> x
  | ECon (Bcon b) -> string_of_bool b
  | ECon (Icon i) -> string_of_int i
  | EPair (e1, e2) ->
    "(" ^ lin_exp e1 ^ ", " ^ lin_exp e2 ^ ")"
  | e -> "(" ^ lin_exp e ^ ")"
```
