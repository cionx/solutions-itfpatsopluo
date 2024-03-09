let rec delete m a =
  match m with
  | [] -> []
  | (a', b') :: m' ->
    let m'' = delete m' a in
    if a = a' then m'' else (a', b') :: m''



let rec lookup_all m a =
  match m with
  | [] -> []
  | (a', b') :: m' ->
    let values' = lookup_all m' a in
    if a = a' then b' :: values' else values'
