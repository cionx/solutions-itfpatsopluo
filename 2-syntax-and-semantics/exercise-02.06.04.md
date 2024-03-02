# Exercise 2.6.4

Test your understanding by giving typing rules for judgments $E \vdash e : t$ and expressions $e \Coloneqq x \mid \lambda x.e \mid ee$ without looking at Figure 2.2.

---

We have the following typing rules:
```text
(x, t) in E
-----------
E  ⊢  x : t



 E, x : t1  ⊢  e : t2
----------------------
E  ⊢  λ x. e : t1 → t2



E  ⊢  e1 : t1 → t2       E  ⊢  e2 : t1
--------------------------------------
           E  ⊢  e1 e2 : t2
```
