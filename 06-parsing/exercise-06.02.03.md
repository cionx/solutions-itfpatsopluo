# Exercise 6.2.3 (Linearization with parentheses only)

> AB-trees can be linearized with just parentheses.
> For instance,
> ```text
>   B(B(A, B(A, A)), B(A, A)) → ((()(()()))(()())) .
> ```
> Declare a linearizer and a parser for this format.

---

A linearization function can be declared as follows:
```ocaml
let rec plinear t =
  match t with
  | A -> "()"
  | B (t1, t2) -> "(" ^ plinear t1 ^ plinear t2 ^ ")"
```

A lexer can be declared as follows:
```ocaml
type token = LP | RP

let lex s =
  let n = String.length s in
  let rec lex' i l =
    if i >= n then List.rev l
    else match String.get s i with
      | ' ' | '\t' | '\n' -> lex' (i + 1) l
      | '(' -> lex' (i + 1) (LP :: l)
      | ')' -> lex' (i + 1) (RP :: l)
      | _ -> failwith "lex: illegal character"
  in
  lex' 0 []
```

We can then parse the resulting list of tokens as follows:
```ocaml
let rec parse l =
  match l with
  | LP :: RP :: l -> (A, l)
  | LP :: l ->
    let (t1, l) = parse l in
    let (t2, l) = parse l in
    let l = verify RP l in
    (B (t1, t2), l)
  | _ -> failwith "parse"
```
