# Exercise 2.6.1

> Give the typing rule for lambda expressions $\lambda x : t. e$ augmented with type specifications.
> Formulate the algorithmic reading of the rule with words.

---

Given an environment $E$ we have to decide if $E \vdash (\lambda x : t. e) : \tilde{t}$ is derivable for some type $\tilde{t}$.
Motivated by the typing rule
```text
   E, x : t1  ⊢  e : t2
  ----------------------
  E  ⊢  λ x. e : t1 → t2
```
we proceed as follows:

1. Recurse on the subproblem $([E, x : t], e)$.

2. If no type can be found for the subproblem, then the algorithm fails.

3. If a type $t'$ can be found for the subproblem, then $E \vdash (\lambda x : t. e) : t \to t'$.
