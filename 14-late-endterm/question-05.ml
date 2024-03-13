let rec pow l = match l with
  | [] -> [[]]
  | x :: l ->
    let p = pow l in
    List.map (List.cons x) p @ p

let rec pow' n l = match n, l with
  | 0, _ -> [[]]
  | _, [] -> []
  | n, x :: l ->
    List.map (List.cons x) (pow' (n - 1) l) @ pow' n l
