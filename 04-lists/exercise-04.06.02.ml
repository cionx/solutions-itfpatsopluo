let rec last l =
  match l with
  | [] -> failwith "last"
  | [x] -> x
  | x :: l -> last l
