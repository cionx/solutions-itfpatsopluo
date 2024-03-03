(** From the textbook. *)

let rec forall m n f =
  if m > n then true else f m && forall (m + 1) n f

let prime x =
  x >= 2 && forall 2 (x - 1) (fun k -> x mod k <> 0)



(** For this exercise. *)

(** [forall' k p f] checks that [f] holds for all [k, k+1, k+2, ...] as long as
    [p] holds. *)
let rec forall' k p f =
  if not (p k) then true
  else f k && forall' (k + 1) p f

let prime' x =
  x >= 2 && forall' 2 (fun k -> k * k <= x) (fun k -> x mod k <> 0)
