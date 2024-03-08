let digit c =
  '0' <= c && c <= '9'

let int_of_digit c =
  Char.code c - Char.code '0'

let int_of_string s =
  let rec helper i acc =
    let c = String.get s i in
    if digit c then helper (i + 1) (10 * acc + int_of_digit c) else acc
  in
  helper 0 0
