(** From the book. *)

let rec iter f n x =
  if n = 0 then x else iter f (n - 1) (f x)



(** For this exercise. *)

let sum n =
  fst (iter (fun (s, k) -> (s + k, k + 1)) n (0, 1))
