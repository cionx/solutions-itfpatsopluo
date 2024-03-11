# Exercise 9.10.3

> Declare the functions `pfac` and `pfac'` in OCaml.

---

We can use the following code:
```ocaml
let divides k x =
  x mod k = 0

let rec pfac x =
  if x < 2 then []
  else
    let k = first (fun k -> divides k x) 2 in
    k :: pfac (x / k)

let rec pfac' k x =
  if k * k > x then [x]
  else if divides k x then k :: pfac' k (x / k)
  else pfac' (k + 1) x
```
