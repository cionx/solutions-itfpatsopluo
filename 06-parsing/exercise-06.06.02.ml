let lowercase c =
  'a' <= c && c <= 'z'

let uppercase c =
  'A' <= c && c <= 'Z'

let digit c =
  '0' <= c && c <= '9'

let valid c =
  lowercase c || uppercase c || digit c || c = '_'

let first_nonvalid s =
  let n = String.length s in
  let rec helper i =
    if i >= n || not (valid (String.get s i)) then i else helper (i + 1)
  in
  helper 0

let identifier s =
  let l = first_nonvalid s in
  String.sub s 0 l
