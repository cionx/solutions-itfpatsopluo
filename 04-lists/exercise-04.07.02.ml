(** From the book. *)

let rec nth l n =
  match l with
  | [] -> failwith "nth"
  | x :: l -> if n < 1 then x else nth l (n - 1)



(** For this exercise. *)

let nth_checked l n =
  if n < 0 then invalid_arg "nth_checked" else nth l n
