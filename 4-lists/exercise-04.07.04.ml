let rec find' x l n =
  match l with
  | [] -> failwith "find"
  | h :: t -> if h = x then n else find' x t (n + 1)

let find x l =
  find' x l 0
