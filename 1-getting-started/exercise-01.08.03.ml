let rec bounded_first' f n k =
  if k > n then -1
  else if f k then k
  else bounded_first' f n (k + 1)

let bounded_first f n =
  bounded_first' f n 0
