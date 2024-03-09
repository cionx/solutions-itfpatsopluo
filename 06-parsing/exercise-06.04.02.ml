(** From the textbook. *)

type tree = A | B of tree * tree | C of tree * tree

let verify c l =
  match l with
  | [] -> failwith "verify: no tokens"
  | c' :: l -> if c = c' then l else failwith "verify: wrong token"



(** For this exercise. *)

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
