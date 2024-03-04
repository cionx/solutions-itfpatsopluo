let rec sorted l =
  match l with
  | [] -> true
  | [_] -> true
  | x :: y :: l -> x <= y && sorted (y :: l)
