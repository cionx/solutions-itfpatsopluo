(** From the book. *)

let rec first f k =
  if f k then k else first f (k + 1)

let sqrt n =
  first (fun k -> (k + 1) * (k + 1) > n) 0
