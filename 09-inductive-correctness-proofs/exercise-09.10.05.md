# Exercise 9.10.5

> Consider the function `f : Z → Z → Z` defined as
> ```text
> f x y := if x = 0 ∧ y = 27 then x + y else f (x − 1) (y + 1)
> ```
> Give an invariant `p x y` for `f` holding exactly for the numbers `f` terminates on.

---

Such an invariant is `p x y := x >= 0 and x + y = 27`.
