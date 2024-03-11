let rec bsearch f x l r =
  if l > r then None
  else
    let m = (l + r) / 2 in
    let y = f m in
    if x < y then bsearch f x l (m - 1)
    else if x > y then bsearch f x (m + 1) r
    else Some m

let search f n x =
  bsearch f x 0 n
