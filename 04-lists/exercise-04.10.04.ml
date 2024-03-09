let rec filter p l =
  match l with
  | [] -> []
  | x :: l ->
    let l' = filter p l in
    if p x then x :: l' else l'
