let rec zip xs ys =
  match xs, ys with
  | [], [] -> []
  | x :: xs', y :: ys' ->
    (x, y) :: zip xs' ys'
  | _ -> invalid_arg "zip: different list lengths"

let rec unzip pairs =
  match pairs with
  | [] -> [], []
  | p :: ps ->
    let x, y = p in
    let xs, ys = unzip ps in
    (x :: xs, y :: ys)
