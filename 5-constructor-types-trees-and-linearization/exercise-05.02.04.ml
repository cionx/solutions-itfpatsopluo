(** From the textbook. *)

type tree = A | B of tree * tree



(** For this exercise *)

let rec dtree n =
  if n = 0 then A else B (A, dtree (n - 1))
