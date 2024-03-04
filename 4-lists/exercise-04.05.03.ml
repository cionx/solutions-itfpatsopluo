let rec forall p l =
  match l with
  | [] -> true
  | x :: l -> p x && forall p l

let forall p l =
  let q x = not (p x) in
  not (List.exists q l)
