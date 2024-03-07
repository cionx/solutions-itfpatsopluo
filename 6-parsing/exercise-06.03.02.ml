(** From the textbook. *)

type tree = A | B of tree * tree

type tokens = AT | BT | LP | RP

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
    | '(' -> lex' (i + 1) (LP :: l)
    | ')' -> lex' (i + 1) (RP :: l)
    | _ -> failwith "lex: illegal character"
  in
  lex' 0 []



(** Part 1. *)

let rec tree l =
  let (t, l) = ptree l in tree' t l
and tree' t l = match l with
  | BT :: l ->
    let (t', l) = ptree l in
    (B (t, t'), l)
  | _ -> (t, l)
and ptree l = match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t, l) = tree l in
    let l = verify RP l in
    (t, l)
  | _ -> failwith "ptree"

let rec left_lin_tree t = match t with
  | A -> "A"
  | B (t1, t2) -> left_lin_tree t1 ^ "B" ^ left_lin_ptree t2
and left_lin_ptree t = match t with
  | A -> "A"
  | t -> "(" ^ left_lin_tree t ^ ")"

let simplify1 s =
  left_lin_tree (fst (tree (lex s)))



(** Part 2. *)

let rec right_lin_tree t = match t with
  | A -> "A"
  | B (t1, t2) -> right_lin_ptree t1 ^ "B" ^ right_lin_tree t2  (* changed *)
and right_lin_ptree t = match t with
  | A -> "A"
  | t -> "(" ^ right_lin_tree t ^ ")"

let simplify2 s =
  right_lin_tree (fst (tree (lex s)))



(** Part 3. *)

let rec left_tree l =
  let (t, l) = left_ptree l in left_tree' t l
and left_tree' t l = match l with
  | BT :: l ->
    let (t', l) = left_ptree l in left_tree' (B (t, t')) l
  | _ -> (t, l)
and left_ptree l = match l with
  | AT :: l -> (A, l)
  | LP :: l ->
    let (t, l) = left_tree l in
    let l = verify RP l in
    (t, l)
  | _ -> failwith "left_tree"

let translate1 s =
  right_lin_tree (fst (left_tree (lex s)))



(** Part 4. *)

let rec ocaml_lin_tree t = match t with
  | A -> "A"
  | B (t1, t2) ->
    "B (" ^ ocaml_lin_tree t1 ^ ", " ^ ocaml_lin_tree t2 ^ ")"

let translate2 s =
  ocaml_lin_tree (fst (left_tree (lex s)))
