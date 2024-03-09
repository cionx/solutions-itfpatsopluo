(** From the textbook. *)

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
      | ' ' | '\n' | '\t' -> lex (i + 1) l
      | _ -> failwith "lex: illegal character"
  in lex 0 []



(** For this exercise. *)

let rec parse l =
  match l with
  | AT :: l -> (A, l)
  | BT :: l ->
    let (t1, l) = parse l in
    let (t2, l) = parse l in
    (B (t1, t2), l)
  | CT :: l ->
    let (t1, l) = parse l in
    let (t2, l) = parse l in
    (C (t1, t2), l)
  | _ -> failwith "tree"
