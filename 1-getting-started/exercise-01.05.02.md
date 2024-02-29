# Exercise 1.5.2 (Maximal digit)

> Declare a function that yields the maximal digit of the decimal representation of a number.
> For instance, the maximal digit of $376$ is $7$.

---

We can declare the desired function via an auxiliary function:
```ocaml
let rec max_digit_aux x max =
  if x = 0 then max
  else
    let digit = x mod 10 in
    let x' = x / 10 in
    let max' = if digit > max then digit else max in
    max_digit_aux x' max'

let max_digit x =
  max_digit_aux x 0
```
