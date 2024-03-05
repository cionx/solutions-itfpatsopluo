let string_of_digit d =
  match d with
  | 0 -> "0"
  | 1 -> "1"
  | 2 -> "2"
  | 3 -> "3"
  | 4 -> "4"
  | 5 -> "5"
  | 6 -> "6"
  | 7 -> "7"
  | 8 -> "8"
  | 9 -> "9"
  | _ -> failwith "string_of_digit"

let rec string_of_int' n =
  if n = 0 then ""
  else (string_of_int' (n / 10)) ^ (string_of_digit (n mod 10))

let string_of_int n =
  if n = 0 then "0"
  else if n < 0 then "-" ^ string_of_int (-n) else
  string_of_int' n
