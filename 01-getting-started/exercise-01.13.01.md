# Exercise 1.13.1

> Consider the declaration
> ```ocaml
> let eager_or x y = x || y
> ```
> Find expressions `e1` and `e2` such that the expressions `e1 || e2` and
> `eager_or e1 e2` behave differently.
> Hint:
> Choose a diverging expression for `e2` and keep in mind that execution of a function application executes all argument expressions.
> In contrast, execution of a conditional “if `e1` then `e2` else `e3`” executes `e1` and then either `e2` or `e3`, but not both.

---

The hint already explains everything.
We can, for example, choose `e1` as `true` and `e2` as `1 / 0 > 0`.
