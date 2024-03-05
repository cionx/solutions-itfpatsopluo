let rec prime' k x =
  (k * k > x) || (x mod k <> 0 && prime' (k + 1) x)

let prime x =
  if x < 2 then false else prime' 2 x
