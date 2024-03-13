let rec insert x l = match l with
  | [] -> [x]
  | y :: l ->
    if x < y then x :: y :: l
    else if x > y then y :: (insert x l)
    else y :: l

let sortRem l =
  let rec loop l acc = match l with
    | [] -> acc
    | x :: l -> loop l (insert x acc)
  in
  loop l []
