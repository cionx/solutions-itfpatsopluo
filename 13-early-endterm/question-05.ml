let rec suf l = match l with
  | [] -> [[]]
  | x :: l -> (x :: l) :: suf l

let rec pre l = match l with
  | [] -> [[]]
  | x :: l -> [] :: List.map (List.cons x) (pre l)

let rec seg l = match l with
  | [] -> [[]]
  | x :: l -> List.map (List.cons x) (pre l) @ seg l
