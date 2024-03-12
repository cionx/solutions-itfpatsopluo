(** From the textbook. *)

let rec iter f n x =
  if n = 0 then x else iter f (n - 1) (f x)



(** For this exercise. *)

let fib n =
  let fib' (a, b) = (b, a + b) in
  fst (iter fib' n (0, 1))
