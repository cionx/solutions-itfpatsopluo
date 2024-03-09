(** From the textbook. *)

type tree = A | B of tree * tree

let verify c l =
  match l with
  | [] -> failwith "verify: no token"
  | c' :: l -> if c = c' then l else failwith "verify: wrong token"



let rec plinear t =
  match t with
  | A -> "()"
  | B (t1, t2) -> "(" ^ plinear t1 ^ plinear t2 ^ ")"



type token = LP | RP

let lex s =
  let n = String.length s in
  let rec lex' i l =
    if i >= n then List.rev l
    else match String.get s i with
      | ' ' | '\t' | '\n' -> lex' (i + 1) l
      | '(' -> lex' (i + 1) (LP :: l)
      | ')' -> lex' (i + 1) (RP :: l)
      | _ -> failwith "lex: illegal character"
  in
  lex' 0 []



let rec parse l =
  match l with
  | LP :: RP :: l -> (A, l)
  | LP :: l ->
    let (t1, l) = parse l in
    let (t2, l) = parse l in
    let l = verify RP l in
    (B (t1, t2), l)
  | _ -> failwith "parse"
