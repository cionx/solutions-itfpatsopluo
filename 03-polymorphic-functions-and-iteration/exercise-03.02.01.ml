(** From the book. *)

let rec iter f n x =
  if n = 0 then x else iter f (n - 1) (f x)



(** For this exercise. *)

let even n = iter not n true

let odd n = iter not n false
