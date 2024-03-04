let rec splits' l1 l2 acc =
  match l2 with
  | [] -> (List.rev l1, []) :: acc
  | x :: l -> splits' (x :: l1) l ((List.rev l1, l2) :: acc)

let splits l =
  splits' [] l []
