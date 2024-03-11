let max_index arr =
  let n = Array.length arr in
  let rec loop i curmax =
    if i >= n then Some curmax
    else if arr.(i) > arr.(curmax) then loop (i + 1) i
    else loop (i + 1) curmax
  in
  if n = 0 then None else loop 1 0
