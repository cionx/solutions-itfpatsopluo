let rec test l = match l with
  | [] | [_] -> true
  | x :: y :: l -> x < y && test (y :: l)
