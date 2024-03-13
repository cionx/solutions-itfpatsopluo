let rec delete m a =
  match m with
  | [] -> []
  | (a', b') :: m ->
    if a = a' then m else (a', b') :: delete m a
