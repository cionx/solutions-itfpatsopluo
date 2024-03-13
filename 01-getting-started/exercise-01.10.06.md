# Exercise 1.10.6

> Declare a function `inv : (N → N) → (N → N)` that given a strictly increasing function `f` yields a function inverting `f`.
> Then express the functions from Exercise 1.10.5 using `inv`.

---

We can declare `inv` as follows:
```text
inv f x := first (λ k. f(k + 1) > x) 0
```
We have already expressed the functions from Exercise 1.10.5 in this way.
