let string_of_bool b =
  match b with
  | true -> "true"
  | false -> "false"

let rec string_of_list' strfun l =
  match l with
  | [] -> ""
  | h :: t -> "; " ^ (strfun h) ^ (string_of_list' strfun t)

let string_of_list strfun l =
  match l with
  | [] -> "[]"
  | (h :: t) -> "[" ^ (strfun h) ^ (string_of_list' strfun t) ^ "]"

let string_of_bool_list =
  string_of_list string_of_bool
