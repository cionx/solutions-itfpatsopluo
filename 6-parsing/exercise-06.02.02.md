# Exercise 6.2.2

> Declare recursive descent parsers for AB-trees and linearizations as follows:
>
> 1. OCaml linearization, with and without extra parentheses.
> 2. Fully parenthesized infix linearization, with and without extra parentheses.
>
> Do the same for ABC-trees.

---



### 1: 1 for AB-trees without extra parentheses

OCaml linearization of AB-trees has the following linearization grammar:
$$
  \mathit{tree}
  \Coloneqq
  \texttt{"A"} \mid \texttt{"B"} \enspace \texttt{"("} \enspace \mathit{tree} \enspace \texttt{","} \enspace \mathit{tree} \enspace \texttt{")"}
$$

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



### 2: 1 for AB-trees with extra parentheses

We allow extra parentheses with the following extended syntax:
$$
  \mathit{tree}
  \Coloneqq
  \texttt{"A"} \mid \texttt{"B"} \enspace \texttt{"("} \enspace \mathit{tree} \enspace \texttt{","} \enspace \mathit{tree} \enspace \texttt{")"} \mid \texttt{"("} \enspace \mathit{tree} \enspace \texttt{")"}
$$
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



### 3: 1 for ABC-trees without extra parentheses

We now have the following grammar:
$$
  \mathit{tree}
  \Coloneqq
  \texttt{"A"}
  \mid \texttt{"B"} \enspace \texttt{"("} \enspace \mathit{tree} \enspace \texttt{","} \enspace \mathit{tree} \enspace \texttt{")"}
  \mid \texttt{"C"} \enspace \texttt{"("} \enspace \mathit{tree} \enspace \texttt{","} \enspace \mathit{tree} \enspace \texttt{")"}
$$
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



### 4: 1 for ABC-trees with extra parentheses

Similar to before, we now use the extended grammar
$$
  \mathit{tree}
  \Coloneqq
  \texttt{"A"}
  \mid \texttt{"B"} \enspace \texttt{"("} \enspace \mathit{tree} \enspace \texttt{","} \enspace \mathit{tree} \enspace \texttt{")"}
  \mid \texttt{"C"} \enspace \texttt{"("} \enspace \mathit{tree} \enspace \texttt{","} \enspace \mathit{tree} \enspace \texttt{")"}
  \mid \texttt{"("} \enspace \mathit{tree} \enspace \texttt{")"}
$$
As before, we only need to extend the function `parse` by the following lines:
```ocaml
  | LP :: l ->
    let (t, l) = parse l in
    let l = verify RP l in
    (t, l)
```



### 5: 2 for AB-trees without extra parentheses

The grammar for fully parentheses infix notation for AB-trees is as follows:
$$
  \mathit{tree}
  \Coloneqq
  \texttt{"A"}
  \mid \texttt{"("} \enspace \mathit{tree} \enspace \texttt{"B"} \enspace \mathit{tree} \enspace \texttt{")"}
$$

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



### 6: 2 for AB-trees with extra parentheses

We can use the following grammar:
$$
  \begin{aligned}
    \mathit{tree}
    &\Coloneqq
    \mathit{ptree} \enspace \texttt{"B"} \enspace \mathit{ptree}
    \mid \mathit{ptree}
    \\
    \mathit{ptree}
    &\Coloneqq
    \texttt{"A"}
    \mid \texttt{"("} \enspace \mathit{tree} \enspace \texttt{")"}
  \end{aligned}
$$
We don’t know how to write a parser for this grammar.



### 7: 2 for ABC-trees without extra parentheses

The grammar for fully parentheses infix notation for ABC-trees is as follows:
$$
  \mathit{tree}
  \Coloneqq
  \texttt{"A"}
  \mid \texttt{"("} \enspace \mathit{tree} \enspace \texttt{"B"} \enspace \mathit{tree} \enspace \texttt{")"}
  \mid \texttt{"("} \enspace \mathit{tree} \enspace \texttt{"C"} \enspace \mathit{tree} \enspace \texttt{")"}
$$
We don’t know how to write a parser for this grammar.



### 8: 2 for ABC-trees with extra parentheses

We can use the following grammar:
$$
  \begin{aligned}
    \mathit{tree}
    &\Coloneqq
    \mathit{ptree} \enspace \texttt{"B"} \enspace \mathit{ptree}
    \mid \mathit{ptree} \enspace \texttt{"C"} \enspace \mathit{ptree}
    \mid \mathit{ptree}
    \\
    \mathit{ptree}
    &\Coloneqq
    \texttt{"A"}
    \mid \texttt{"("} \enspace \mathit{tree} \enspace \texttt{")"}
  \end{aligned}
$$
We don’t know how to write a parser for this grammar.



### Remark on parsers

The parsers that we have managed to write so far have the following pattern:
- look at the first token of the input stream;
- decide with production rule to use based on this token.

This can be generalized as follows:
- look at the first $k$ token of the input stream, for a fixed number $k$;
- decide with production rule to use based on these tokens.

But this doesn’t suffice for same of the above grammars.
We therefore don’t know how to write parsers for these grammars.
