(** From the problem statement. *)

type tree = A | B of tree * tree
type token = AT | BT



(** For this exercise. *)

let rec lin t = match t with
  | A -> [AT]
  | B (t1, t2) -> lin t1 @ lin t2 @ [BT]

let rec par l1 l2 =
  match l1, l2 with
  | [], [t] -> Some t
  | AT :: l1, l2 ->
    par l1 (A :: l2)
  | BT :: l1, t2 :: t1 :: l2 ->
    par l1 (B (t1, t2) :: l2)
  | _ -> None
