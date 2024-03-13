# Exercise 5.6.3

> Extend the grammar for abstract expressions and the above development with pair expressions and projections:
> ```text
>   e ::= ...  |  (e1, e2)  |  π1 e  |  π2 e
> ```
> As concrete syntax for the projections `π1` and `π2` you may choose the identifiers `fst` and `snd`.

---

We now have the following abstract syntax:
```text
e  ::=  x  |  c  |  e1 o e2  |  e1 e2
     |  (e1, e2)  |  π1 e  |  π2 e
     |  if e1 then e2 else e3
     |  λ x. e
     |  let x = e1 in e2
     |  let rec f x = e1 in e2
```

We must extend the type `exp` correspondingly:
```ocaml
type var = string
type con = Bcon of bool | Icon of int
type op = Add | Sub | Mul | Leq
type exp =
  | Var of var
  | Con of con
  | Pair of exp * exp       (* new *)
  | Oapp of op * exp * exp
  | Fapp of exp * exp
  | Fst of exp              (* new *)
  | Snd of exp              (* new *)
  | If of exp * exp * exp
  | Lam of var * exp
  | Let of var * exp * exp
  | Letrec of var * var * exp * exp
```

Next we need to extend the linearization grammar.
We treat the constructors `π1` and `π2` on the same level as function application and pairs on the level of a parenthesized expression:
```text
 exp  ::=  "if" exp "then" exp "else" exp
        |  "fun" var "->" exp
        |  "let" var "=" exp "in" exp
        |  "let rec" var var "=" exp "in" exp
        |  cexp
cexp  ::=  sexp "<=" sexp  |  sexp
sexp  ::=  sexp "+" mexp  |  sexp "-" mexp  |  mexp
mexp  ::=  mexp "*" aexp  |  aexp
aexp  ::=  aexp pexp  |  "fst" pexp  |  "snd" pexp  |  pexp
pexp  ::=  var  |  con  |  "(" exp "," exp ")"  |  "(" exp ")"
```

Finally, we extend the linearization functions:
```ocaml
let rec exp e = match e with
  | If (e1, e2, e3) ->
    "if " ^ exp e1 ^ " then " ^ exp e2 ^ " else " ^ exp e3
  | Lam (x, e) ->
    "fun " ^ x ^ " -> " ^ exp e
  | Let (x, e1, e2) ->
    "let " ^ x ^ " = " ^ exp e ^ " in " ^ exp e
  | Letrec(f, x, e1, e2) ->
    "let rec " ^ f ^ " " ^ x ^ " = " ^ exp e1 ^ " in " ^ exp e2
  | e -> cexp e
and cexp e = match e with
  | Oapp (Leq, e1, e2) ->
    exp e1 ^ " <= " ^ exp e2
  | e -> sexp e
and sexp e = match e with
  | Oapp(Add, e1, e2) ->
    sexp e1 ^ " + " ^ mexp e2
  | Oapp(Sub, e1, e2) ->
    sexp e1 ^ " - " ^ mexp e2
  | e -> mexp e
and mexp e = match e with
  | Oapp(Mul, e1, e2) ->
    mexp e1 ^ " * " ^ aexp e2
  | e -> aexp e
and aexp e = match e with
  | Fapp (e1, e2) ->
    aexp e1 ^ " " ^ pexp e2
  | Fst e ->                              (* new *)
    "fst " ^ pexp e
  | Snd e ->                              (* new *)
    "snd " ^ pexp e
  | e -> pexp e
and pexp e = match e with
  | Var x -> x
  | Con (Bcon b) -> string_of_bool b
  | Con (Icon i) -> string_of_int i
  | Pair (e1, e2) ->                      (* new *)
    "(" ^ exp e1 ^ ", " ^ exp e2 ^ ")"
  | e -> "(" ^ exp e ^ ")"
```
