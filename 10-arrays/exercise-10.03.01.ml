let lsearch arr x =
  let n = Array.length arr in
  let rec loop i =
    if i >= n then None
    else if x = arr.(i) then Some i
    else loop (i + 1)
  in
  loop 0
