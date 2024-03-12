# Typing and evaluation rules 10P

> Complete the typing and evaluation rules for lambda expressions and function applications.
> ```text
> --------------------     --------------------
>     E ⊢ λ x. e :             V ⊢ λ x. e ⊳
>
> -------------------      -------------------
>     E ⊢ e1 e2 :              V ⊢ e1 e2 ⊳
> ```

---

The rules are as follows:
```text
 E, x : t1 ⊢ e : t2
---------------------
E ⊢ λ x. e : t1 -> t2



----------------------
V ⊢ λ x. e ⊳ (x, e, V)        <-- our notation for closures



E ⊢ e1 : t1 -> t2     E ⊢ e2 : t1
---------------------------------
         E ⊢ e1 e2 : t2



V ⊢ e1 ⊳ (x, e, V')     V ⊢ e2 ⊳ v2     V', x : v2 ⊢ e ⊳ v
----------------------------------------------------------
                      V ⊢ e1 e2 ⊳ v
```
