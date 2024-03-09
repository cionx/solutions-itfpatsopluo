# Exercise 5.6.3

> Extend the grammar for abstract expressions and the above development with pair expressions and projections:
> $$
>   e \Coloneqq \cdots \mid (e_1 , e_2) \mid \pi_1 \; e \mid π_2 \; e
> $$
> As concrete syntax for the projections π1 and π2 you may choose the identifiers $\mathsf{fst}$ and $\mathsf{snd}$.

---

We now have the following abstract syntax:
$$
\begin{aligned}
  e \Coloneqq{}& x \mid c \mid e_1 \; o \; e_2 \mid e_1 \; e_2 \\
  \mid{}& (e_1, e_2) \mid \pi_1 \; e \mid \pi_2 \; e \\
  \mid{}& \text{if } e_1 \text{ then } e_2 \text{ else } e_3 \\
  \mid{}& \lambda x. e \\
  \mid{}& \text{let } x = e_1 \text{ in } e_2 \\
  \mid{}& \text{let rec } f \;x = e_1 \text{ in } e_2
\end{aligned}
$$

We must extend the type $\mathit{exp}$ correspondingly:
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
We treat the constructors $π_1$ and $π_2$ on the same level as function application and pairs on the level of a parenthesized expression:
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
    \mathit{aexp} \Coloneqq{}& \mathit{aexp} \enspace \mathit{pexp} \mid \texttt{fst} \; \mathit{pexp} \mid \texttt{snd} \; \mathit{pexp} \mid \mathit{pexp} \\
    \mathit{pexp} \Coloneqq{}& \mathit{var} \mid \mathit{con} \mid \texttt{"("} \enspace \mathit{exp} \enspace \texttt{","} \enspace \mathit{exp} \enspace \texttt{")"} \mid \texttt{"("} \enspace \mathit{exp} \enspace \texttt{")"}
  \end{aligned}
$$

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
