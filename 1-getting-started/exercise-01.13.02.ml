let sort (x, y, z) =
  if x <= y && y <= z then (x, y, z)
  else if x <= z && z <= y then (x, z, y)
  else if y <= x && x <= z then (y, x, z)
  else if y <= z && z <= x then (y, z, x)
  else if z <= x && x <= y then (z, x, y)
  else (z, y, x)
