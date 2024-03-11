# Exercise 10.8.3

> Declare a function `unit → int` that enumerates the factorials 1, 1, 2, 6, 24, 120, …

---

We can declare this function as follows:
```ocaml
let fac =
  let state = ref (0, 1) in
  fun () ->
    let (n, f) = !state in
    state := (n + 1, (n + 1) * f);
    f
```
