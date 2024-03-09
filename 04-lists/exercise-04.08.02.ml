let rec nth_opt l n =
  match l with
  | [] -> []
  | x :: l -> if n < 1 then [x] else nth_opt l (n-1)
