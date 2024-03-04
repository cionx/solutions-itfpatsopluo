# Exercise 4.3.1

> Declare a function $\mathit{seq}$ following the mathematical definition in the previous section.

---

We can use the following declaration:
```ocaml
let rec seq m n =
  if m > n then [] else m :: seq (m + 1) n
```
