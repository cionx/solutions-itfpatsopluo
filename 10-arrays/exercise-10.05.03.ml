(** From the textbook. *)

let swap arr i j =
  let tmp = arr.(i) in arr.(i) <- arr.(j); arr.(j) <- tmp



(** For this exercise. *)

let ssort arr =
  let rec max_index i curmax =
    if i < 0 then curmax
    else max_index (i - 1) (if arr.(i) > arr.(curmax) then i else curmax)
  in
  let rec ssort' r =
    if r <= 0 then ()
    else
      let i = max_index (r - 1) r in
      swap arr i r;
      ssort' (r - 1)
  in
  ssort' (Array.length arr - 1)
