# Exercise 4.8.1

> Declare a function $\mathit{nth\_opt\_checked}$ that raises an invalid-argument exception if $n < 0$ and otherwise agrees with $\mathit{nth\_opt}$.

---

We can declare $\mathit{nth\_opt\_checked}$ as a wrapper around $\mathit{nth\_opt}$.
```ocaml
let nth_opt_checked l n =
  if n < 0 then invalid_arg "nth_opt_checked" else nth_opt l n
```

(It would make more sense for $\mathit{nth\_opt\_checked}$ to return $\mathsf{None}$ instead of raising an exception.
Maybe the exercise is wrongly formulated?)
