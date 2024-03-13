(** From the exercise statement. *)

type tree = A | B of tree * tree



(** For this exercise. *)

let rec min n =
  if n = 0 then A else B (A, min (n - 1))

let rec max n =
  if n = 0 then A
  else let t = max (n - 1) in B (t, t)

let rec check t = match t with
  | A -> true
  | B (A, t) | B (t, A) -> check t
  | _ -> false
