(** From the textbook. *)

let rec first p k =
  if p k then k else first p (k + 1)

let rec prime_fac x =
  if x < 2 then []
  else let k = first (fun k -> x mod k = 0) 2 in
    k :: prime_fac (x / k)
