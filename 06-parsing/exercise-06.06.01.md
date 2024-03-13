# Exercise 6.6.1

> Declare a function `string → int` reading a number from a string.
> Assume that the string starts with a digit and read as many digits as possible.
> For instance, `"123 Dieter"` should yield the number `123`.
> Realize the function with a tail-recursive helper function and make use of ASCII codes (see Exercise 6.1.4).
> You may use the function
> ```ocaml
> let num c = Char.code c - Char.code '0'
> ```
> to convert characters that are digits into numbers.

---

We use an auxiliary function to check if a character is a digit:
```ocaml
let digit c =
  '0' <= c && c <= '9'
```
We also use an auxiliary function to convert a digit to an integer:
```ocaml
let int_of_digit c =
  Char.code c - Char.code '0'
```

Finally, the following function reads a number from a string:
```ocaml
let int_of_string s =
  let rec helper i acc =
    let c = String.get s i in
    if digit c then helper (i + 1) (10 * acc + int_of_digit c) else acc
  in
  helper 0 0
```
