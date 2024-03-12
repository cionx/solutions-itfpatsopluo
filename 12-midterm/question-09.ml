(** From the textbook. *)

type tree = A | B of tree * tree



(** For this exercise. *)

let rec ctree n =
  if n <= 0 then A else B (A, ctree (n - 1))
