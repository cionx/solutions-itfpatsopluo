# Exercise 6.4.2 (Pair Notation)

> We may linearize trees $B(t_1, t_2)$ as pairs $(t_1, t_2)$.
> In this case, $B$ needs neither precedence nor associativity since it can be accommodated at the lowest level $\mathit{ptree}$.
> Consider the following parsing grammar accommodating $C$ as an infix operator and $B$ with pair notation:
> $$
>   \begin{aligned}
>     \mathit{tree}  &\Coloneqq \mathit{ptree} \enspace \mathit{tree}'
>     \\
>     \mathit{tree}' &\Coloneqq \texttt{"C"} \enspace \mathit{ptree} \enspace \mathit{tree}' \mid [\,] \\
>     \mathit{ptree} &\Coloneqq \texttt{"A"} \mid \texttt{"("} \enspace \mathit{tree} \enspace \texttt{")"} \mid \texttt{"("} \enspace \mathit{tree} \enspace \texttt{","} \enspace \mathit{tree} \enspace \texttt{")"}
>   \end{aligned}
> $$
> Declare parsing functions for the grammar treating $C$ as left-associative operator.

---

In the lexer we introduce a new token `CM` for commas:
```ocaml
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
```

To implement a parser we rewrite the provided grammar as follows:
$$
  \begin{aligned}
    \mathit{tree}  &\Coloneqq \mathit{ptree} \enspace \mathit{tree}'
    \\
    \mathit{tree'} &\Coloneqq \texttt{"C"} \enspace \mathit{ptree} \enspace \mathit{tree}' \mid [\,] \\
    \mathit{ptree} &\Coloneqq \texttt{"A"} \mid \texttt{"("} \enspace \mathit{tree} \enspace \mathit{ptree'}
    \\
    \mathit{ptree}' &\Coloneqq \texttt{")"} \mid \texttt{","} \enspace \mathit{tree} \enspace \texttt{")"}
  \end{aligned}
$$

This grammar translates into the following parsing function:
```ocaml
let rec tree l =
  let (t, l) = ptree l in tree' t l
and tree' t l = match l with
  | CT :: l ->
    let (t', l) = ptree l in tree' (C (t, t')) l
  | _ -> (t, l)
and ptree l = match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t, l) = tree l in ptree' t l
  | _ -> failwith "ptree"
and ptree' t l = match l with
  | LP :: l -> (t, l)
  | CM :: l ->
    let (t', l) = tree l in
    let l = verify RP l in
    (B (t, t'), l)
  | _ -> failwith "ptree'"
```
