let rec bsearch f x l r =
  if l = r then l
  else
    let m = (l + r + 1) / 2 in (* rounded up *)
    let y = f m in
    if y > x then bsearch f x l (m - 1)
    else bsearch f x m r

let cbroot x =
  bsearch (fun x -> x * x * x) x 0 x
