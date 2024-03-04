let rec repeating l =
  match l with
  | [] -> false
  | x :: t -> List.mem x t || repeating t

let nonrepeating l =
  not (repeating l)

let rec makeset l =
  match l with
  | [] -> []
  | x :: l ->
    let l' = makeset l in
    if List.mem x l' then l' else x :: l'
