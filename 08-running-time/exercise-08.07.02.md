# Exercise 8.7.2 (Characterizations of asymptotic dominance)

> Show that the following propositions are equivalent for all functions `f, g : N → N`:
> 1. `∃ n0, k, c.  ∀ n >= n0. f(n) <= k * g(n) + c`
> 2. `∃ K. ∀ n. f(n) <= K * (g(n) + 1)`.

---

### `1. ==> 2.`

Let `n0`, `k` and `c` such that `f(n) <= k * g(n) + c` for every `n >= n0`.
Let
```text
K := max( f(0), ..., f(n0), k, c ) .
```
For every `n <= n0` we then have
```text
f(n)  <=  K  <=  K * g(n) + K  =  K * (g(n) + 1) .
```
and for every `n >= n0` we also have
```text
f(n)  <=  k * g(n) + c  <=  K * g(n) + K  =  K * (g(n) + 1) .
```

### `2. ==> 1.`

We may choose `n0 := 0`, `k := K` and `c := K`.
Then
```text
f(n)  <=  K * (g(n) + 1)  =  K * g(n) + K  =  k * g(n) + c
```
for every `n >= n0`.
