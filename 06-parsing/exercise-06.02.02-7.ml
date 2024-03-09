(** From the textbook. *)

let verify c l =
  match l with
  | [] -> failwith "verify: no token"
  | c' :: l -> if c = c' then l else failwith "verify: wrong token"



(** For this exercise. *)

type tree = A | B of tree * tree | C of tree * tree

type tokens = AT | BT | CT | LP | RP

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
    | _ -> failwith "lex: illegal character"
  in
  lex' 0 []

let rec tree l = match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t1, l) = tree l in tree' t1 l
  | _ -> failwith "tree"
and tree' t1 l = match l with
  | BT :: l ->
    let (t2, l) = tree l in
    let l = verify RP l in
    (B (t1, t2), l)
  | CT :: l ->
    let (t2, l) = tree l in
    let l = verify RP l in
    (C (t1, t2), l)
  | _ -> failwith "tree'"
