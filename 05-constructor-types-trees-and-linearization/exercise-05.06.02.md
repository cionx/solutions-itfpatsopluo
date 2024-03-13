# Exercise 5.6.2

> Declare a function `exp → string` that linearizes expressions following the given linearization grammar.
> Your linearization should be such that the string can serve as OCaml input after removal
> of the double quotes `'"'`, provided only lower-case identifiers are used for variables.

---

The given linearization grammar is as follows:
```text
 exp  ::=  "if" exp "then" exp "else" exp
        |  "fun" var "->" exp
        |  "let" var "=" exp "in" exp
        |  "let rec" var var "=" exp "in" exp
        |  cexp
cexp  ::=  sexp "<=" sexp  |  sexp
sexp  ::=  sexp "+" mexp  |  sexp "-" mexp  |  mexp
mexp  ::=  mexp "*" aexp  |  aexp
aexp  ::=  aexp pexp  |  pexp
pexp  ::=  var  |  con  |  "(" exp ")"
```
The resulting linearization functions are as follows:
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
    sexp e1 ^ " <= " ^ sexp e2
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
  | e -> pexp e
and pexp e = match e with
  | Var x -> x
  | Con (Bcon b) -> string_of_bool b
  | Con (Icon i) -> string_of_int i
  | e -> "(" ^ exp e ^ ")"
```
