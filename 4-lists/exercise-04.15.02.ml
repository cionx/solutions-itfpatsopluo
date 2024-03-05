let rec least_prime_factor' k x =
  if k * k > x then x
  else if x mod k = 0 then k
  else least_prime_factor' (k + 1) x

let least_prime_factor x =
  if x < 2 then invalid_arg "least_prime_factor"
  else least_prime_factor' 2 x
