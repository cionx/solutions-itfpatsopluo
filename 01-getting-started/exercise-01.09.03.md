# Exercise 1.9.3 (Sum functions)

> 1. Define a function `N → N` computing the sum `0 + 1 + 2 + ... + n` of the first `n` numbers.
> 2. Define a function `N → N` computing the sum `0 + 1^2 + 2^2 + ... + n^2` of the first `n` square numbers.
> 3. Define a function `sum : (N → N) → N → N` computing for a given function `f` the sum `f(0) + f(1) + f(2) + ... + f(n)`.
> 4. Give partial applications of the function `sum` from 3 providing specialized sum functions as asked for by 1 and 2.

---

### 1.

We can define this function as follows:
```text
        s1 : N → N
      s1 0 := 0
s1 (n + 1) := (n + 1) + s1 n
```

### 2.

We can define this function as follows:
```text
        s2 : N → N
      s2 0 := 0
s2 (n + 1) := (n + 1)^2 + s2 n
```

### 3.
We can define this function as follows:
```text
          sum : (N → N) → N → N
      sum f 0 := f 0
sum f (n + 1) := f (n + 1) + sum f n
```

### 4.

We can express the functions `s1` and `s2` in terms of `sum` as follows:
```text
s1 = sum (λ x. x)
s2 = sum (λ x. x^2)
```
