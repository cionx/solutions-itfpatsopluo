(** From the book. *)

let rec first f k =
  if f k then k else first f (k + 1)



(** For this exercise. *)

let div' x y n =
  first (fun k -> (k + 1) * y > x) n
