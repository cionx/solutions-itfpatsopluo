# Exercise 1.13.1

> Consider the declaration
> ```ocaml
> let eager_or x y = x || y
> ```
> Find expressions $e_1$ and $e_2$ such that the expressions $e_1 \mathop{||} e_2$ and
> $\mathit{eager\_or} \enspace e_1 \enspace e_2$ behave differently.
> Hint:
> Choose a diverging expression for $e_2$ and keep in mind that execution of a function application executes all argument expressions.
> In contrast, execution of a conditional “if $e_1$ then $e_2$ else $e_3$” executes $e_1$ and then either $e_2$ or $e_3$, but not both.

---

The hint already explains everything.
We can, for example, choose $e_1$ as $\mathit{true}$ and $e_2$ as $1/0 > 0$.
