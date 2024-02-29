let min x y : int = if x <= y then x else y

let min3 x y z = min (min x y) z

let min3' x y z : int =
  let a = if x <= y then x else y in
  if a <= z then a else z

let min3'' x y z : int =
  let a = (if x <= y then x else y) in
  (if a <= z then a else z)
