(** From the textbook. *)

let verify c l =
  match l with
  | [] -> failwith "verify: no token"
  | c' :: l -> if c = c' then l else failwith "verify: wrong token"



(** For this exercise. *)

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
