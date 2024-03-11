# Exercise 10.8.1

> Declare a function `newEnum : unit → unit → int` such that `newEnum ()` yields a function enumerating `1, 2, 3, ...`
> Make sure that each call `newEnum ()` yields a fresh enumerator function starting from 1.

---

We can declare the function `newEnum` as follows:
```ocaml
let newEnum () =
  let counter = ref 0 in
  (fun () -> counter := !counter + 1; !counter)
```
