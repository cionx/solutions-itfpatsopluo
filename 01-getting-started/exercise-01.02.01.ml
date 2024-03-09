(** From the book. *)

let square x = x * x



(** For this exercise. *)

let pow5 x = x * square (square x)

let pow5' x =
  let a = x * x in
  let b = a * a in
  x * b

let pow5'' x =
  let a = x * x in (let b = a * a in x * b)
