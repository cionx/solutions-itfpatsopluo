(** From the textbook. *)

let swap arr i j =
  let x = arr.(i) in arr.(i) <- arr.(j); arr.(j) <- x

let qsort1 a =
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
  let rec qsort1' l r =
    if l >= r then ()
    else let m = partition l r in
      qsort1' l (m - 1); qsort1' (m + 1) r
  in
  qsort1' 0 (Array.length a - 1)



(** For this exercise. *)

let qsort2 a =
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
  let rec qsort2' l r =
    if l >= r then ()
    else
      let mid = (l + r) / 2 in swap a mid r;  (* new line *)
      let m = partition l r in
      qsort2' l (m - 1); qsort2' (m + 1) r
  in
  qsort2' 0 (Array.length a - 1)

let time f x =
  let t1 = Sys.time () in
  let _ = f x in
  let t2 = Sys.time () in
  t2 -. t1

