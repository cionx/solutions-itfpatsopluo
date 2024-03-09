# Exercise 3.5.1 (Untypable expressions)

> We say that an expression $e$ is **typable** if there are an environment $E$ and a type $t$ such that the judgment $E \vdash e : t$ is derivable.
> Explain why the following expression are not typable.  
> a) $\lambda f. f f$  
> b) $(\lambda f. (f \; 5, f \; \mathtt{"a"})) \; (\lambda x. x)$

---

### a)

We have the following rule for deriving the type of lambda expressions:
```text
  E, x : t1  ⊢  e : t2
------------------------
E  ⊢  λ x. e  :  t1 → t2
```
In our case, we’d need types $t_1$ and $t_2$ such that
$$
  E, f : t_1  \vdash  f f : t_2
$$
We have the following rule for deriving the type of applications:
```text
E  ⊢  e1 : t1 → t2     E  ⊢  e2 : t1
------------------------------------
          E  ⊢  e1 e2 : t2
```
In our case we’d need another type $t_3$ such that both
$$
  E, f : t_1  \vdash  f : t_3 \to t_2 \,,
  \qquad\text{and}\qquad
  E, f : t_1  \vdash  f : t_3 \,.
$$
In the same environment, $f$ therefore needs to have both type $t_3$ and $t_3 \to t_2$, which is not possible (even with polymorphic types?).

### b)

Intuitively speaking, to apply $\lambda f. (f \; 5, f \; \mathtt{"a"})$ to $\lambda x. x$ we need to choose a specific type for $\lambda x. x$, not just a polymorphic one.
We thus need to instantiate the polymorphic type $\forall \alpha. \alpha \to \alpha$ of $λ x. x$ in such a way that it accepts both $\mathit{int}$ arguments and $\mathit{string}$ arguments at the same time, which is not possible.

More formally, we start by trying to give the overall expression $(\lambda f. (f \; 5, f \; \mathtt{"a"})) \; (\lambda x. x)$ a type $t_1$:
```text
E ⊢ (λ f. (f 5, f "a")) : t1
```
This requires the following premises for another type $t_2$:
```text
E ⊢ λ f. (f 5, f "a") : t2 → t1     E ⊢ λ x. x : t2
---------------------------------------------------
       E ⊢ (λ f. (f 5, f "a")) (λ x. x) : t1
```
We focus on the first premise:
```text
E ⊢ λ f. (f 5, f "a") : t2 → t1
```
To derive this type judgement we need the following premise:
```text
 E, f : t2 ⊢ (f 5, f "a") : t1
-------------------------------
E ⊢ λ f. (f 5, f "a") : t2 → t1
```
To arrive at $(f \; 5, f \; \mathtt{"a"}) : t_1$ for some type $t_1$ we need the following two premises for some types $t_3$ and $t_4$:
```text
E, f : t2 ⊢ f 5 : t3     E, f : t2 ⊢ f "a" : t4
```
This, in turn, requires the following four premises for suitable types $t_5$ and $t_6$:
```text
E, f : t2 ⊢ f : t5 → t3     E, f : t2 ⊢ 5 : t5
----------------------------------------------
             E, f : t2 ⊢ f 5 : t3


E, f : t2 ⊢ f : t6 → t4     E, f : t2 ⊢ "a" : t6
------------------------------------------------
             E, f : t2 ⊢ f "a" : t4
```
We see that the types $t_5$ and $t_6$ must be chosen as $\mathit{int}$ and $\mathit{string}$ respectively.
The type of $f$ is in the environment $E, f : t_2$ must therefore be both $\mathit{int} \to t_3$ and $\mathit{string} \to t_4$ for suitable types $t_3$ and $t_4$.
But this is apparently not possible (even though we have polymorphic types?).
