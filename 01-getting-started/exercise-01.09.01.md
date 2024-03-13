# Exercise 1.9.1

> 1. Write `λ x y k. (k + 1) * y > x` as a nested lambda expression.
> 2. Write `test 11 3 10` as a nested application.
> 3. Write `int → int → int → bool` as a nested function type.

---

### 1.

`λ x. λ y. λ k. (k + 1) * y > x`

### 2.

`test 11 3 10 = ((test 11) 3) 10`

### 3.

`int → (int → (int → bool))`
