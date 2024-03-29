(** From the textbook. *)

type tree = A | B of tree * tree



(** For this exercise. *)

let rec min n =
  if n = 0 then A else B (A, min (n - 1))

let min_size n =
  2 * n + 1
