(** From the textbook. *)

type tree = A | B of tree * tree * tree



(** For this exercise. *)

let rec size t = match t with
  | A -> 1
  | B (t1, t2, t3) -> 1 + size t1 + size t2 + size t3

let rec depth t = match t with
  | A -> 0
  | B (t1, t2, t3) -> 1 + max (depth t1) (max (depth t2) (depth t3))

let rec min_tree n =
  if n = 0 then A else B (A, A, min_tree (n - 1))
