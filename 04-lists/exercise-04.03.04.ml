let rec dec' n acc =
  if n = 0 then acc
  else dec' (n / 10) ((n mod 10) :: acc)

let dec n =
  dec' n []



let rec num' digits acc =
  match digits with
  | [] -> acc
  | d :: ds -> num' ds (10 * acc + d)

let num digits =
  num' digits 0
