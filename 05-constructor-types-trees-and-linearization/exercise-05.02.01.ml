(** From the textbook. *)

type tree = A | B of tree * tree



(** For this exercise. *)

let rec depth t =
  match t with
  | A -> 0
  | B (t1, t2) -> 1 + max (depth t1) (depth t2)
