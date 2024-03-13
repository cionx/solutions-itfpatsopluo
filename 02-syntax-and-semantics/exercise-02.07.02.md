# Exercise 2.7.2

> Two expressions are alpha equivalent if they are equal up to consistent renaming of local variables.
> For instance, `λ x. x` and `λ y. y` are alpha equivalent.
> Consistent renaming of local variables is also known as alpha renaming.
> For each of the following expressions give an alpha equivalent expression such that no variable has more than one binding occurrence.
> 1. `(λ x. x) (λ x. x)`
> 2. `λ x. λ x. λ x. x`
> 3. `let rec x x = x in x`

---

The expression `(λ x. x) (λ x. x)` is alpha equivalent to `(λ x. x) (λ y. y)`.

The expression `λ x. λ x. λ x. x` is alpha equivalent to `λ x. λ y. λ z. z`.

The expression `let rec x x = x in x` is alpha equivalent to `let rec f x = x in f`.
