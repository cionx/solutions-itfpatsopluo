# Exercise 5.7.1

> Declare the constructor type `nat` in OCaml and declare functions for addition, multiplication, and exponentiation.
> Also declare functions converting between non-negative machine integers and constructor numbers.

---

We can declare the type `nat` as follows:
```ocaml
type nat = Zero | Succ of nat
```

We can then define addition, multiplication, and exponentiation as follows:
```ocaml
let rec add m n =
  match m with
  | Zero -> n
  | Succ m -> Succ (add m n)

let rec mul m n =
  match m with
  | Zero -> Zero
  | Succ m -> add (mul m n) n

let rec pow m n =
  let one = Succ Zero in
  match n with
  | Zero -> one
  | Succ n -> mul (pow m n) m
```

We can tail-recursively convert between non-negative integers and constructor numbers as follows:
```ocaml
let rec nat_to_int' n acc =
  match n with
  | Zero -> acc
  | Succ n -> nat_to_int' n (acc + 1)

let nat_to_int n =
  nat_to_int' n 0

let rec int_to_nat' i acc =
  if i = 0 then acc else int_to_nat' (i - 1) (Succ acc)

let int_to_nat i =
  int_to_nat' i Zero
```
