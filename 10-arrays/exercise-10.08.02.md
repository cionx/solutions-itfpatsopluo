# Exercise 10.8.2

> Declare a function `unit → int` that enumerates the square numbers 0, 1, 4, 9, 16, …

---

We can declare this function as follows:
```ocaml
let square =
  let counter = ref 0 in
  fun () ->
    let output = !counter * !counter in
    counter := !counter + 1;
    output
```
