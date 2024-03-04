fun l ->
  match l with
  | [] -> None
  | x :: l' -> begin
    match l' with
    | [] -> None
    | y :: l'' ->
      if x = 0 then Some y
      else if y = 1 then Some x
      else None
    end
