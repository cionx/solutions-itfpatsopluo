let rec has_value f x l r =
  l <= r
  &&
  let m = (l + r) / 2 in
  let y = f m in
  if x < y then has_value f x l (m - 1)
  else if x > y then has_value f x (m + 1) r
  else true
