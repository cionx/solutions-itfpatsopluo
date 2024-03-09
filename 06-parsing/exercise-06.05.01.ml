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



(** For this exercise. *)

let rec depost l stack =
  match l, stack with
  | [], s -> s
  | AT :: l, s -> depost l (A :: s)
  | BT :: l, t2 :: t1 :: s -> depost l ((B (t1, t2)) :: s)
  | CT :: l, t2 :: t1 :: s -> depost l ((C (t1, t2)) :: s)
  | _, _ -> []

let depost' s =
  match depost (lex s) [] with
  | [t] -> Some t
  | _ -> None
