# Exercise 4.7.2

> Declare a function `nth_checked` that raises an invalid-argument exception (see §1.13) if `n < 0` and otherwise agrees with `nth`.
> Check that your function behaves the same as the predefined function `List.nth`.

---

We can declare `nth_checked` as a wrapper around `nth`:
```ocaml
let nth_checked l n =
  if n < 0 then invalid_arg "nth_checked" else nth l n
```
