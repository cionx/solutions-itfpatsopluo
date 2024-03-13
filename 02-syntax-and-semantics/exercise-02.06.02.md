# Exercise 2.6.2

> Give the typing rule for recursive let expressions
> ```text
> let rec f (x : t1) : t2 = e1 in e2
> ```
> augmented with type specifications.
> Formulate the algorithmic reading of the rule with words.

---

Given an environment `E` we need to decide if `E ⊢ (let rec f (x : t1) : t2 = e1 in e2) : t` for some type `t`.
Motivated by the typing rule
```text
E, f : t1 → t2, x : t1  ⊢  e1 : t2       E, f : t1 → t2  ⊢  e2 : t
------------------------------------------------------------------
              E  ⊢  (let rec f x = e1 in e2) : t
```
we proceed as follows:

1. Check that `E, f : t1 → t2, x : t1  ⊢  e1 : t2`.
   If this is not the case then the algorithm fails.
   Otherwise, we proceed to the next step.

2. Recur on the subproblem `([E, f : t1 → t2], e2)`.

3. If this subproblem has no solution, then the algorithm fails.

4. If the subproblem is solved by a type `t` then also `E ⊢ (let rec f x = e1 in e2) : t`.
