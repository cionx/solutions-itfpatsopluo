let rec maximum' l m =
  match l with
  | [] -> m
  | x :: l -> maximum' l (max x m)

let maximum l =
  match l with
  | [] -> failwith "maximum"
  | x :: l -> maximum' l x
