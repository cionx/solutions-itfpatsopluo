# Exercise 10.8.4

> Declare a function `unit → int` that enumerates the Fibonacci numbers 0, 1, 1, 2, 3, 5, …

---

We can declare this function as follows:
```ocaml
let fib =
  let state = ref (0, 1) in
  fun () ->
    let (a, b) = !state in
    state := (b, a + b);
    a
```
