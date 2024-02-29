# Exercise 1.2.1

> Write a function computing $x^5$ with just 3 multiplications.
> Write both a version with $\mathit{square}$ and a version with local declarations.
> Write the version with local declarations with and without redundant parentheses marking the nesting.

---

A version with $\mathit{square}$ is as follows:
```ocaml
let pow5 x = x * square (square x)
```
A version with local declarations is as follows:
```ocaml
let pow5' x =
  let a = x * x in
  let b = a * a in
  x * b
```
With redundant parentheses we get the following instead:
```ocaml
let pow5'' x =
  let a = x * x in (let b = a * a in x * b)
```
