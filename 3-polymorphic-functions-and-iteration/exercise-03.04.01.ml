(** From the textbook. *)

let rec forall m n f =
  if m > n then true else f m && forall (m + 1) n f



(** For this exercise. *)

let rec exists m n f =
  if m > n then false else f m || exists (m + 1) n f

let rec exists m n f =
  let notf x = not (f x) in
  not (forall m n notf)
