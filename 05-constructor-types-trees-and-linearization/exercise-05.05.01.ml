(** From the textbook. *)

type tree = A | B of tree * tree | C of tree * tree



(** For this exercise. *)

let rec prefix t =
  match t with
  | A -> "A"
  | B (t1, t2) -> "B" ^ prefix t1 ^ prefix t2
  | C (t1, t2) -> "C" ^ prefix t1 ^ prefix t2

let rec postfix t =
  match t with
  | A -> "A"
  | B (t1, t2) -> postfix t1 ^ postfix t2 ^ "B"
  | C (t1, t2) -> postfix t1 ^ postfix t2 ^ "C"

let rec infix t =
  match t with
  | A -> "A"
  | B (t1, t2) -> "(" ^ infix t1 ^ "B" ^ infix t2 ^ ")"
  | C (t1, t2) -> "(" ^ infix t1 ^ "C" ^ infix t2 ^ ")"
