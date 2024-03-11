let init n f =
  if n = 0 then [||]
  else
    let arr = Array.make n (f 0) in
    let rec loop i =
      if i >= n then arr else (arr.(i) <- f i; loop (i + 1))
    in
    loop 1
