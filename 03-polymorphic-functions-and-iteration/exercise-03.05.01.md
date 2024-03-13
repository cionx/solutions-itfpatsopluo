# Exercise 3.5.1 (Untypable expressions)

> We say that an expression `e` is **typable** if there are an environment `E` and a type `t` such that the judgment `E ⊢ e : t` is derivable.
> Explain why the following expression are not typable.
> 1. `λ f. f f`
> 2. `(λ f. (f 5, f "a")) (λ x. x)`

---

### 1.

We have the following rule for deriving the type of lambda expressions:
```text
  E, x : t1  ⊢  e : t2
------------------------
E  ⊢  λ x. e  :  t1 → t2
```
In our case, we’d need types `t1` and `t2` such that
```text
E, f : t1  ⊢  f f : t2
```
We have the following rule for deriving the type of applications:
```text
E  ⊢  e1 : t1 → t2     E  ⊢  e2 : t1
------------------------------------
          E  ⊢  e1 e2 : t2
```
In our case we’d need another type `t3` such that both
``
E, f : t1  ⊢  f : t3 → t2    and     E, f : t1  ⊢  f : t3 .
``
In the same environment, `f` therefore needs to have both type `t3` and `t3 → t2`, which is not possible (even with polymorphic types?).

### 2.

Intuitively speaking, to apply `λ f. (f 5, f "a")` to `λ x. x` we need to choose a specific type for `λ x. x`, not just a polymorphic one.
We thus need to instantiate the polymorphic type `∀ α. α → α` of `λ x. x` in such a way that it accepts both `int` arguments and `string` arguments at the same time, which is not possible.

More formally, we start by trying to give the overall expression `(λ f. (f 5, f "a")) (λ x. x)` a type `t1`:
```text
E ⊢ (λ f. (f 5, f "a")) : t1
```
This requires the following premises for another type `t2`:
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
To arrive at `(f 5, f "a") : t1` for some type `t1` we need the following two premises for some types `t3` and `t4`:
```text
E, f : t2 ⊢ f 5 : t3     E, f : t2 ⊢ f "a" : t4
```
This, in turn, requires the following four premises for suitable types `t5` and `t6`:
```text
E, f : t2 ⊢ f : t5 → t3     E, f : t2 ⊢ 5 : t5
----------------------------------------------
             E, f : t2 ⊢ f 5 : t3


E, f : t2 ⊢ f : t6 → t4     E, f : t2 ⊢ "a" : t6
------------------------------------------------
             E, f : t2 ⊢ f "a" : t4
```
We see that the types `t5` and `t6` must be chosen as `int` and `string` respectively.
The type of `f` is in the environment `E, f : t2` must therefore be both `int → t3` and `string → t4` for suitable types `t3` and `t4`.
But this is apparently not possible (even though we have polymorphic types?).
