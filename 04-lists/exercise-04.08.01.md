# Exercise 4.8.1

> Declare a function `nth_opt_checked` that raises an invalid-argument exception if `n < 0` and otherwise agrees with `nth_opt`.

---

We can declare `nth_opt_checked` as a wrapper around `nth_opt`.
```ocaml
let nth_opt_checked l n =
  if n < 0 then invalid_arg "nth_opt_checked" else nth_opt l n
```

(It would make more sense for `nth_opt_checked` to return `None` instead of raising an exception.
Maybe the exercise is wrongly formulated?)
