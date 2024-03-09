(** From the textbook. *)

type tree = A | B of tree * tree



(** For this exercise. *)

let rec tree t =
  match t with
  | A -> "A"
  | B (t1, t2) -> ptree t1 ^ "B" ^ tree t2
and ptree t =
  match t with
  | A -> "A"
  | B (_, _) -> "(" ^ tree t ^ ")"
