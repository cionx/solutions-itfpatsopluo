# Exercise 10.8.6 (Enumerator with reset function)

> Declare a function
> ```text
> unit → (unit → int) × (unit → unit)
> ```
> that on each application yields a pair consisting of an enumerator for 1, 2, 3, … and a function resetting the enumerator to 1.

---

We can declare the described function as follows:
```ocaml
let enum_reset () =
  let counter = ref 0 in
  let enum () = counter := !counter + 1; !counter in
  let reset () = counter := 0 in
  (enum, reset)
```
