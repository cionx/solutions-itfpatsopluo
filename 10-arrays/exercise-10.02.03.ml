let sum arr =
  let n = Array.length arr in
  let rec loop i acc =
    if i >= n then acc else loop (i + 1) (acc + arr.(i))
  in
  loop 0 0
