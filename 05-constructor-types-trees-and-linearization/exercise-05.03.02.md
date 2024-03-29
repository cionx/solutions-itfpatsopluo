# Exercise 5.3.2

> Declare a function `L(B) → string` linearizing boolean lists using bracket notation.

---

We start with a function that converts booleans into strings:
```ocaml
let string_of_bool b =
  match b with
  | true -> "true"
  | false -> "false"
```

We then declare an auxiliary function that converts a list of values `x1, x2, ..., xn` into the string `"; x1; x2; ...; xn"` (the periods here are metasyntax, and won’t appear in the actual string):
```ocaml
let rec string_of_list' strfun l =
  match l with
  | [] -> ""
  | h :: t -> "; " ^ (strfun h) ^ (string_of_list' strfun t)
```

We use this auxiliary function to linearize a list of values:
```ocaml
let string_of_list strfun l =
  match l with
  | [] -> "[]"
  | (h :: t) -> "[" ^ (strfun h) ^ (string_of_list' strfun t) ^ "]"
```

Finally, we specify the above function `string_of_list` to lists of booleans:
```ocaml
let string_of_bool_list =
  string_of_list string_of_bool
```
