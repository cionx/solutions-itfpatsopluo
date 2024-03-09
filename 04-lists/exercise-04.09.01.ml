let test l =
  match l with
  | [] -> false
  | x :: l ->
    x = 1 && begin
      match l with
      | [] -> false
      | y :: l -> y = 2
      end
