# Exercise 3.3.1

> Declare a function computing the sum `0 + 1 + 2 + ... + n` by iteration starting from the pair `(0, 1)`.

---

We can use the iterating function `f : (s, k) -> (s + k, k + 1)`, which satisfies
```text
f^n (0, 1) = (1 + 2 + ... + n, n + 1) .
```
The OCaml code is as follows:
```ocaml
let sum n =
  fst (iter (fun (s, k) -> (s + k, k + 1)) n (0, 1))
```
