# Decimal representation 8P

> Declare a function `dec` that yields the decimal representation of a number as a list.
> For instance, `dec(456) = [4, 5, 6]` and `dec(0) = []`.

---

We can declare `dec` as follows in OCaml:
```ocaml
let dec n =
  let rec loop k acc =
    if k <= 0 then acc
    else loop (k / 10) ((k mod 10) :: acc)
  in
  loop n []
```
