# Exercise 1.1.2

> To what value does the program
> ```ocaml
> let a = 2 let a = a * a let a = a * a
> ```
> bind the identifier `a`?

---

The identifier `a` is first bound to `2`, then to `2 * 2 = 4`, then to `4 * 4 = 16`.
