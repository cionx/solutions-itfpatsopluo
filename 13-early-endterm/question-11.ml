let dec x =
  let rec loop x acc =
    if x = 0 then acc
    else loop (x / 10) ((x mod 10) :: acc)
  in
  loop x []

let num arr =
  let rec loop i acc =
    if i >= Array.length arr then acc
    else loop (i + 1) (10 * acc + arr.(i))
  in
  loop 0 0
