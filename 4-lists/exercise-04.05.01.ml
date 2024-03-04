let rec mem x l =
  match l with
  | [] -> false
  | h :: t -> x = h || mem x t



let rec exists p l =
  match l with
  | [] -> false
  | h :: t -> p h || exists p t

let mem x l =
  exists (( = ) x) l
