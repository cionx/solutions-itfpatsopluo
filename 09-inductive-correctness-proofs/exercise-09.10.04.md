# Exercise 9.10.4

> Consider the function `f : Z → Z` defined as
> ```text
> f(x) := if x = 7 then x else f(x − 1)
> ```
> Give a predicate `p(x)` holding exactly for the numbers `f` terminates on.
> Convince yourself that `p` is an invariant for `f`.

---

The function `f x` terminates if and only if `x >= 7`.
We therefore choose `p(x) := x >= 7`.

Suppose that `p x` holds and that evaluation of `f x` recursively calls `f (x - 1)`.
That `p x` holds tells us that `x >= 7`, and that `f (x - 1)` is called tells us that `x <> 7`.
Together this means that `x > 7`, and therefore `x - 1 >= 7`.
This shows that `p` is indeed an invariant for `f`.
