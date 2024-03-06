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



(** We don’t know how to write a parser. *)
