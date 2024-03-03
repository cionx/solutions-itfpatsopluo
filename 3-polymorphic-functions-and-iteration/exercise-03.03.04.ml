(** From the textbook. *)

let rec iter f n x =
  if n = 0 then x else iter f (n - 1) (f x)



(** For this exercise. *)

let faci n =
  fst (iter (fun (p, k) -> (p * (k + 1), k + 1)) n (1, 0))

let rec fac' n p k =
  if n = 0 then p else fac' (n - 1) (p * (k + 1)) (k + 1)
