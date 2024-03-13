let rec count' x l acc =
  match l with
  | [] -> acc
  | x' :: l -> count' x l (if x' = x then acc + 1 else acc)

let count x l =
  count' x l 0
