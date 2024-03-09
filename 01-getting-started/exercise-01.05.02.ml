let rec max_digit_aux x max =
  if x = 0 then max
  else
    let digit = x mod 10 in
    let x' = x / 10 in
    let max' = if digit > max then digit else max in
    max_digit_aux x' max'

let max_digit x =
  max_digit_aux x 0
