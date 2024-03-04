let rec find_opt' x l n =
  match l with
  | [] -> None
  | h :: t -> if x = h then Some n else find_opt' x t (n + 1)

let find_opt x l =
  find_opt' x l 0
