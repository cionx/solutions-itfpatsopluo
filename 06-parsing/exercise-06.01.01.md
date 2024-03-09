# Exercise 6.1.1

> Write a tail-recursive lexer for ABC-trees treating all characters but `'A'`, `'B'`, `'C'`, `'('`, and `')'` as white space characters.
> For instance, `"A (likes) B"` should yield the list $[\mathit{AT}, \mathit{LP}, \mathit{RP}, \mathit{BT}]$.

---

We only need to replace the two lines
```ocaml
| ' ' | '\n' | '\t' -> lex (i + 1) l
| _ -> failwith "lex: illegal character"
```
by the following single line:
```ocaml
| _ -> lex (i + 1) l
```
We thus arrive at the following OCaml code:
```ocaml
let lex s =
  let n = String.length s in
  let rec lex i l =
    if i >= n then List.rev l
    else match String.get s i with
      | 'A' -> lex (i + 1) (AT :: l)
      | 'B' -> lex (i + 1) (BT :: l)
      | 'C' -> lex (i + 1) (CT :: l)
      | '(' -> lex (i + 1) (LP :: l)
      | ')' -> lex (i + 1) (RP :: l)
      | _ -> lex (i + 1) l
  in lex 0 []
```
