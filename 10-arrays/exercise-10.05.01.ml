(** [forallnbs p arr] is [p arr.(0) arr(1) && ... && p arr.(n - 2) arr.(n - 1)],
    where [n] is the length of arr. *)
let forallnbs p arr =
  let n = Array.length arr in
  let rec loop i =
    if i >= n then true
    else p arr.(i - 1) arr.(i) && loop (i + 1)
  in
  loop 1

let sorted arr = forallnbs ( <= ) arr
let strictly_sorted arr = forallnbs ( < ) arr
