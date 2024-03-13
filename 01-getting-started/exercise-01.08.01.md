# Exercise 1.8.1

> Declare a function `div'` such that `div x y = div' x y 0` by specializing `first` to the test `λ k. (k + 1) * y > x`.

---

We can declare the such a function `div'` as follows:
```ocaml
let div' x y n =
  first (fun k -> (k + 1) * y > x) n
```
