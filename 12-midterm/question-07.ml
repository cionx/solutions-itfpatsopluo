let rec insert x l =
  match l with
  | [] -> [x]
  | y :: l ->
    if x <= y then x :: y :: l else y :: (insert x l)

let sort l =
  let rec loop l acc = match l with
    | [] -> acc
    | x :: l -> loop l (insert x acc)
  in
  loop l []
