let clone arr =
  let n = Array.length arr in
  if n = 0 then [||]
  else
    let x = arr.(0) in
    let a = Array.make n x in
    let rec loop i =
      if i >= n then a else (a.(i) <- arr.(i); loop (i + 1))
    in
    loop 1
