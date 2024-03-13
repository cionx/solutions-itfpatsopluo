let rec gpow k l =
  if k < 0 then invalid_arg "gpow" else
    match k, l with
    | 0, _ -> [[]]
    | _, [] -> []
    | k, x :: l -> List.map (fun l -> x :: l) (gpow (k - 1) l) @ gpow k l 
