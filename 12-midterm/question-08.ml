let rec pre l = match l with
  | [] -> [[]]
  | x :: l -> [] :: List.map (List.cons x) (pre l)
