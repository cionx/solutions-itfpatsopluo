let rec fac n =
  if n = 0 then 1 else n * fac (n - 1)

let rec fac' a n =
  if n = 0 then a else fac' (n * a) (n - 1)
