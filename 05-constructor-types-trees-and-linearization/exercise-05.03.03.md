# Exercise 5.3.3

> Declare a function $\mathit{int} \to \mathit{string}$ linearizing numbers.
> As it comes to strings, all you need are string concatenation and string constants (e.g., `"5"`).
> First write a function converting digits 0, …, 9 into singleton strings `"0"`, …, `"9"`.

---

We start with a function that converts single digits into singleton strings:
```ocaml
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
```

We then declare a function $\mathit{string\_of\_int}'$ that converts positive integers to strings:
```ocaml
let rec string_of_int' n =
  if n = 0 then ""
  else (string_of_int' (n / 10)) ^ (string_of_digit (n mod 10))
```

Finally, we declare $\mathit{string\_of\_int}$ as a wrapper function around $\mathit{string\_of\_int}'$:
```ocaml
let string_of_int n =
  if n = 0 then "0"
  else if n < 0 then "-" ^ string_of_int (-n) else
  string_of_int' n
```
