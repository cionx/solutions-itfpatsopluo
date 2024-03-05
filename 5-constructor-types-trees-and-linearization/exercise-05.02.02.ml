(** From the textbook. *)

type tree = A | B of tree * tree



(** For this exercise. *)

let rec breadth t =
  match t with
  | A -> 1
  | B (t1, t2) -> breadth t1 + breadth t2
