let rec count' x l acc =
  match l with
  | [] -> acc
  | h :: t -> count' x t (if h = x then acc + 1 else acc)

let count x l =
  count' x l 0
