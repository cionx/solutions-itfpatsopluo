let rec pfac x k =
  if k * k > x then [x]
  else if x mod k = 0 then k :: pfac (x / k) k
  else pfac x (k + 1)
