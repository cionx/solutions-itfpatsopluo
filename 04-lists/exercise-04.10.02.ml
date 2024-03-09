let rec prefixes l =
  match l with
  | [] -> [[]]
  | x :: l -> [] :: List.map (fun p -> x :: p) (prefixes l)

let rec suffixes l =
  match l with
  | [] -> [[]]
  | x :: l' -> l :: suffixes l'

let rec segments l =
  match l with
  | [] -> [[]]
  | x :: l -> List.map (fun l' -> x :: l') (prefixes l) @ segments l
