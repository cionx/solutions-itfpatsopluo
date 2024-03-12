let divides x y =
  y mod x = 0

let rec pfac' k x =
  if k * k > x then [x]
  else if divides k x then k :: pfac' k (x / k)
  else pfac' (k + 1) x

let pfac x =
  pfac' 2 x
