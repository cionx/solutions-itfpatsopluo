# Exercise 9.3.12 (Power lists)

> Consider a power list function defined as follows:
> ```text
> pow : ∀ α. L(α) → L(L(α))
>       pow [] := [[]]
> pow (x :: l) := pow l @ map (λ l. x :: l) (pow l)
> ```
> 1. Prove `|pow l| = 2^|l|` where `|l|` is notation for length `l`.
>    The equation says that a list of length `n` has `2^n` sublists.
> 2. Give the running time function for function `pow`.
> 3. Give the running time function for a variant of `pow` which avoids the binary recursion with a `let` expression.

---

### 1.

We show the proposed equality by induction over `l`.

Base case:
```text
  |pow []|
= |[[]]|      definition of pow
= |[] :: []|  definition of ( :: )
= 1 + |[]|    definition of length
= 1 + 0
= 1
```
Induction step:
```text
  |pow (x :: l)|
= |pow l @ map (λ l. x :: l) (pow l)|     definition of pow
= |pow l| + |map (λ l. x :: l) (pow l)|   Exercise 9.3.9 a)
= |pow l| + |pow l|                       Exercise 9.3.9 c)
= 2 * |pow l|                             algebra
= 2 * 2^|l|                               induction hypothesis
= 2^(1 + |l|)                             algebra
= 2^|x :: l|                              definition of length
```

### 2.

The running time lists of length 0 is constant: `r(0) = c`.

To compute `pow (x :: l)` we do the following:
- Compute a copy `l2` of `pow l`, costing us `r(n)`.
- Run `map` over `l2`, with a function that takes constant time.
  This costs us `O(|l2|) = O(2^|l|)`.
  We denote the result by `l2'`.
- Calculate a copy `l1` of `pow l`, costing us `r(n)`.
- Concatenate `l1` and `l2'`, costing us `O(|l1|) = O(2^|l|)`.

We thus find that `r(n + 1) = r(n) + O(2^n) + r(n) + O(2^n) = 2 r(n) + O(2^n)`.

The recurrence relation `r(n + 1) = 2 r(n) + C 2^n` has the solution `r(n) = 2^(n - 1) (C n + c1)` for a constant `c1`.
We hence find that `r(n)` has growth type `O(n 2^n)`.

### 3.

We can use the following declaration instead:
> ```text
> pow' : ∀ α. L(α) → L(L(α))
>       pow [] := [[]]
> pow' (x :: l) := let p = pow l in t @ map (λ l. x :: l) t
> ```

The running time of this modified function satisfies the recurrence relation `r'(n + 1) = r'(n) + O(2^n)`.
The solution to `r'(n + 1) = r'(n) + C 2^n` is `r'(n) = C (2^n - 1) + c1` for a constant `c1`.
We hence find that `r'(n)` has growth type `O(2^n)`.
