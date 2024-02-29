let sort (x, y, z) =
  let (y, z) = if y <= z then (y, z) else (z, y) in
  if x <= y then (x, y, z)
  else if x <= z then (y, x, z)
  else (y, z, x)
