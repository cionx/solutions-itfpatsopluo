(** From the problem statemant. *)

type tree = A | B of tree * tree
type token = AT | BT



(** For this exercise. *)

let rec lin t = match t with
  | A -> [AT]
  | B (t1, t2) ->
    BT :: lin t1 @ lin t2

let rec tree l = match l with (* L(token) -> tree * L(token) *)
  | [] -> failwith "par"
  | AT :: l -> (A, l)
  | BT :: l ->
    let t1, l = tree l in
    let t2, l = tree l in
    (B (t1, t2), l)

let par l =
  match tree l with
  | (t, []) -> t
  | _ -> failwith "par"
