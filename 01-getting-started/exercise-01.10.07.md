# Exercise 1.10.7

> Let `f : N → N` be strictly increasing.
> Convince yourself that the functions
> ```text
> λ x. first (λ k. f(k) = x) 0
> λ x. first (λ k. f(k) >= x) 0
> λ x. first (λ k. f(k + 1) > x) 0
> ```
> all invert `f` and find out how they differ.

---

We denote these functions by `g1`, `g2` and `g3` respectively.

### First function

The function `g1` maps `x` to its minimal preimage under `f`.
If no such preimage exists, then `g1` does not terminate.
The function `g1` is therefore partial (unless `f` is the identity function).

### Second function

The function `g2` is total.

If `x = f(n)` for some integer `n` then `f(k) < x` for every `k < n`.
The number `n` is therefore minimal with the property that `f(n) >= x`.
Consequently, `g2(x) = n`, and thus `g2(f(n)) = n`.

We have `f(g2(x)) >= x` for every `x`.

### Third function

The function `g3` is total.

If `x = f(n)` for some integer `n` then `f(k) < f(n) = x` for every `k < n` but `f(n + 1) > f(n) = x`.
The integer `n` is therefore minimal with the property that `f(n + 1) > x`.
Consequently, `g3(x) = n`, and thus `g3(f(n)) = n`.

For every `x >= f(0)` we can characterize `g3(x)` as the maximal integer `n` for which `f(n) <= x`.
We thus have `f(g3(x)) <= x` for every `x >= f(0)`.
