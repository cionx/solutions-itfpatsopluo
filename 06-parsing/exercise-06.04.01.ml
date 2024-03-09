(** From the textbook. *)

type tree = A | B of tree * tree | C of tree * tree

type tokens = AT | BT | CT | LP | RP

let verify c l =
  match l with
  | [] -> failwith "verify: no tokens"
  | c' :: l -> if c = c' then l else failwith "verify: wrong token"

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



(** Part 1. *)

let rec tree1 l =
  let (t, l) = btree1 l in tree1' t l
and tree1' t l = match l with
  | CT ::l ->
    let (t', l) = btree1 l in tree1' (C (t, t')) l
  | _ -> (t, l)
and btree1 l =
  let (t, l) = ptree1 l in btree1' t l
and btree1' t l = match l with
  | BT :: l ->
    let (t', l) = ptree1 l in btree1' (B (t, t')) l
  | _ -> (t, l)
and ptree1 l = match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t, l) = tree1 l in
    let l = verify RP l in
    (t, l)
  | _ -> failwith "ptree1"



(** Part 2. *)

let rec tree2 l =
  let (t, l) = btree2 l in tree2' t l
and tree2' t l = match l with
  | CT :: l ->
    let (t', l) = btree2 l in tree2' (C (t, t')) l
  | _ -> (t, l)
and btree2 l =
  let (t, l) = ptree2 l in btree2' t l
and btree2' t l = match l with
  | BT :: l ->
    let (t', l) = ptree2 l in
    let (t'', l) = btree2' t' l in
    (B (t, t''), l)
  | _ -> (t, l)
and ptree2 l = match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t, l) = tree2 l in
    let l = verify RP l in
    (t, l)
  | _ -> failwith "ptree2"



(** Part 3. *)

let rec tree3 l =
  let (t, l) = btree3 l in tree3' t l
and tree3' t l = match l with
  | CT ::l ->
    let (t', l) = btree3 l in tree3' (C (t, t')) l
  | _ -> (t, l)
and btree3 l =
  let (t, l) = ptree3 l in btree3' t l
and btree3' t l = match l with
  | BT :: l ->
    let (t', l) = ptree3 l in btree3' (B (t, t')) l
  | AT :: _ | LP :: _ ->                              (* new case *)
    let (t', l) = ptree3 l in btree3' (B (t, t')) l
  | _ -> (t, l)
and ptree3 l = match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t, l) = tree3 l in
    let l = verify RP l in
    (t, l)
  | _ -> failwith "ptree3"



(** Part 4. *)

let rec tree4 l =
  let (t, l) = btree4 l in tree4' t l
and tree4' t l = match l with
  | CT :: l ->
    let (t', l) = btree4 l in tree4' (C (t, t')) l
  | _ -> (t, l)
and btree4 l =
  let (t, l) = ptree4 l in btree4' t l
and btree4' t l = match l with
  | BT :: l ->
    let (t', l) = ptree4 l in
    let (t'', l) = btree4' t' l in
    (B (t, t''), l)
  | AT :: _ | LP :: _ ->            (* new case *)
    let (t', l) = ptree4 l in
    let (t'', l) = btree4' t' l in
    (B (t, t''), l)
  | _ -> (t, l)
and ptree4 l = match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t, l) = tree4 l in
    let l = verify RP l in
    (t, l)
  | _ -> failwith "ptree4"
