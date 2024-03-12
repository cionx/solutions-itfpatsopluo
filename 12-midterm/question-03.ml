let rev l =
  let rec loop l acc =
    match l with
    | [] -> acc
    | x :: l -> loop l (x :: acc)
  in
  loop l []
