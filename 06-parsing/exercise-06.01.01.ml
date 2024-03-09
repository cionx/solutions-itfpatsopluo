type tree = A | B of tree * tree | C of tree * tree

type token = AT | BT | CT | LP | RP

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
