let rec seq m n =
  if m > n then [] else m :: seq (m + 1) n
