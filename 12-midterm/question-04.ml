let init n f =
  let rec loop k acc =
    if k < 0 then acc
    else loop (k - 1) (f k :: acc)
  in
  loop (n - 1) []
