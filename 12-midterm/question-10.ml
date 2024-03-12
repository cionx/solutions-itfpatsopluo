(** From the textbook. *)

type tree = A | B of tree * tree



(** For this exercise. *)

let rec lin t = match t with
  | A -> "A"
  | B (t1, t2) -> lin t1 ^ "B" ^ plin t2
and plin t = match t with
  | A -> "A"
  | t -> "(" ^ lin t ^ ")"
