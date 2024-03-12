(** From the textbook. *)

let rec first f k =
  if f k then k else first f (k + 1)



(** For this exercise. *)

let prime x =
  let rec loop k x =
    if k * k > x then true
    else if x mod k = 0 then false
    else loop (k + 1) x
  in
  x >= 2 && loop 2 x

let enum =
  let num = ref 1 in
  fun () ->
    num := first prime (!num + 1);
    !num
