# Exercise 6.1.2

> Write a tail-recursive lexer for ABC-trees treating comments `(∗ … ∗)` as white space as does an OCaml interpreter.
> Make sure that nested comment parentheses like `(∗ … (∗ … ∗) … ∗)` are treated correctly.
> Hint:
> Have a counter argument recording how many opening comment parentheses have to be closed.

---

Our solution:
```ocaml
let lex s =
  let n = String.length s in
  let token_of_char c =
    match c with
    | 'A' -> AT
    | 'B' -> BT
    | 'C' -> CT
    | '(' -> LP
    | ')' -> RP
    | _ -> failwith "lex: illegal character"
  in
  let rec lex' i l cdepth =
    let process_char c =
      match c with
      | ' ' | '\n' | '\t' -> lex' (i + 1) l cdepth
      | c -> lex' (i + 1)
        (if cdepth > 0 then l else token_of_char c :: l)
        cdepth
    in
    (** no characters left *)
    if i >= n then List.rev l
    (** exactly one character left *)
    else if i = n - 1 then process_char (String.get s i)
    (** at least two characters left *)
    else
      match String.get s i, String.get s (i + 1) with
      | '(', '*' -> lex' (i + 2) l (cdepth + 1)
      | '*', ')' when cdepth > 0 -> lex' (i + 2) l (cdepth - 1)
      | c, _ -> process_char c
  in
  lex' 0 [] 0
```
