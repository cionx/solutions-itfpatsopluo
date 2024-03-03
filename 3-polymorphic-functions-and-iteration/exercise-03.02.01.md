# Exercise 3.2.1

> Declare a function testing evenness of numbers by iterating on booleans.
> What do you have to change to obtain a function checking oddness?

---

We can repeatedly apply the negation function `not : bool -> bool` to the start value `true`:
```ocaml
let even n = iter not n true
```
We can check for oddness by using the start value `false` instead:
```ocaml
let odd n = iter not n false
```
