# Exercise 2.9.1

> Give typing and evaluation rules for the lazy boolean operations assuming they are accommodated as abstract expressions.

---

We have the following two typing rules:
```text
e1 : bool     e2: bool
----------------------
   e1 || e2 : bool



e1 : bool     e2: bool
----------------------
   e1 && e2 : bool
```

The evaluation rules are as follows:
```text
E ⊢ e1 ⊳ true     E ⊢ e2 ⊳ v2
-----------------------------
     E ⊢ e1 || e2 ⊳ true



E ⊢ e1 ⊳ false     E ⊢ e2 ⊳ v2
------------------------------
      E ⊢ e1 || e2 ⊳ v2



E ⊢ e1 ⊳ false     E ⊢ e2 ⊳ v2
------------------------------
     E ⊢ e1 && e2 ⊳ false



E ⊢ e1 ⊳ true     E ⊢ e2 ⊳ v2
-----------------------------
      E ⊢ e1 && e2 ⊳ v2
```
