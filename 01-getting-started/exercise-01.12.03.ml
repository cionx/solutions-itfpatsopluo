let median (x, y, z) =
  let (y, z) = if y <= z then (y, z) else (z, y) in
  if x <= y then y
  else if x <= z then x
  else z
