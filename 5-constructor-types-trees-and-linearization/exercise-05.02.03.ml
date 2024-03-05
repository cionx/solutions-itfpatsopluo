(** From the textbook. *)

type tree = A | B of tree * tree



(** For this exercise. *)

let rec mirror t =
  match t with
  | A -> A
  | B (t1, t2) -> B (mirror t2, mirror t1)
