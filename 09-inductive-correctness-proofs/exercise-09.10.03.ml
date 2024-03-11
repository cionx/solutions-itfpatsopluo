(** From the textbook. *)

let rec first f k =
  if f k then k else first f (k + 1)



(** For this exercise. *)

let divides k x =
  x mod k = 0

let rec pfac x =
  if x < 2 then []
  else
    let k = first (fun k -> divides k x) 2 in
    k :: pfac (x / k)

let rec pfac' k x =
  if k * k > x then [x]
  else if divides k x then k :: pfac' k (x / k)
  else pfac' (k + 1) x
