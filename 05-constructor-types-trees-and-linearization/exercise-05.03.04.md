# Exercise 5.3.4

> Declare a function $\mathcal{L}(\mathit{int}) \to \mathit{string}$ linearizing lists of integers using bracket notation.

---

We only have to combine the general function $\mathit{string\_of\_list}$ that we wrote for Exercise 5.3.2 with the function $\mathit{string\_of\_int}$ from Exercise 5.3.3:
```ocaml
(** From Exercise 5.3.2. *)

let rec string_of_list' strfun l =
  match l with
  | [] -> ""
  | h :: t -> "; " ^ (strfun h) ^ (string_of_list' strfun t)

let string_of_list strfun l =
  match l with
  | [] -> "[]"
  | (h :: t) -> "[" ^ (strfun h) ^ (string_of_list' strfun t) ^ "]"

(** From Exercise 5.3.3. *)

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



(** For this exercise. *)

let string_of_int_list =
  string_of_list string_of_int
```
