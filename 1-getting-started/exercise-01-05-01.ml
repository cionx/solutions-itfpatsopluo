let rec first_digit x =
  if x < 10 then x else first_digit (x / 10)
