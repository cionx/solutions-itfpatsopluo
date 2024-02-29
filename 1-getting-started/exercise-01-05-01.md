# Exercise 1.5.1 (First digit)

> Declare a function that yields the first digit of the decimal representation of a number. 
> For instance, the first digit of $367$ is $3$.

---

We can declare the desired function as follows:
```ocaml
let rec first_digit x =
  if x < 10 then x else first_digit (x / 10)
```
