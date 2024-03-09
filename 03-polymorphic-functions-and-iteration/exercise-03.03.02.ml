(** From the textbook. *)

let rec iter f n x =
  if n = 0 then x else iter f (n - 1) (f x)



(** For this exercise. *)

let f n =
  let (x, _, _) =
    iter (fun (a, b, c) -> (b, c, a + b + c)) n (0, 1, 1)
  in x
