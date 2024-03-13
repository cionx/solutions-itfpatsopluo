let find x l =
  let rec loop i l = match l with
    | [] -> None
    | y :: l ->
      if x = y then Some i else loop (i + 1) l
  in
  loop 0 l
