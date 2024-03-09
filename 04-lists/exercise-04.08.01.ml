(** From the book. *)

let rec nth_opt l n =
  match l with
  | [] -> None
  | x :: l -> if n < 1 then Some x else nth_opt l (n-1)



(** For this exercise. *)
let nth_opt_checked l n =
  if n < 0 then invalid_arg "nth_opt_checked" else nth_opt l n
