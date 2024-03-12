let dec n =
  let rec loop k acc =
    if k <= 0 then acc
    else loop (k / 10) ((k mod 10) :: acc)
  in
  loop n []
