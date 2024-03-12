# Prime factorization 8P

> Declare a function `pfac` that yields the prime factorization of a number `x >= 2` as a list.
> For instance, `pfac(60) = [2, 2, 3, 5]`.

---

We can declare the function `pfac` as follows:
```ocaml
let divides x y =
  y mod x = 0

let rec pfac' k x =
  if k * k > x then [x]
  else if divides k x then k :: pfac' k (x / k)
  else pfac' (k + 1) x

let pfac x =
  pfac' 2 x
```
