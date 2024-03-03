let rec iter f n x =
  if n = 0 then x else f (iter f (n - 1) x)
