(** From the textbook. *)

let swap arr i j =
  let tmp = arr.(i) in arr.(i) <- arr.(j); arr.(j) <- tmp



(** For this exercise. *)

let ensure_median arr left right =
  let middle = (left + right) / 2 in
  let x = arr.(left) in
  let y = arr.(middle) in
  let z = arr.(right) in
  let median =
    if (y <= x && x <= z) || (z <= x && x <= y) then left
    else if (x <= y && y <= z) || (z <= y && y <= x) then middle
    else right
  in
  swap arr median right

let qsort a =
  let partition l r =
    let x = a.(r) in
    let rec loop i j =
      if j < i
      then (swap a i r; i)
      else if a.(i) < x then loop (i + 1) j
      else if a.(j) >= x then loop i (j - 1)
      else (swap a i j; loop (i + 1) (j - 1))
    in loop l (r - 1)
  in
  let rec qsort' l r =
    if l >= r then ()
    else begin
      ensure_median a l r;                (* new line *)
      let m = partition l r in
      qsort' l (m - 1); qsort' (m + 1) r
      end
  in qsort' 0 (Array.length a - 1)
