# Exercise 8.5.2

> Binary search can be used for inversion of strictly increasing functions.
> 1. Declare a function `square` deciding whether an integer `x >= 0` is a square number (that is, `x = n^2` for some `n`).
>    The worst-case running time of `square x` should be logarithmic in `x`.
> 2. Declare a function `sqrt` that given an integer `x >= 0` computes the largest `n` such that `n^2 <= x`.
>    The worst-case running time of `sqrt x` should be logarithmic in `x`.
> 3. Declare a function `inv` that given a strictly increasing function `f : N → N` and an integer `x >= 0` computes the largest `n` such that `f(n) <= x`.
>    The worst-case running time of `inv f x` should be logarithmic in `x` if `f` has constant running time.

---

### 1.

If `x = n^2` for some integer `n`, then we may assume that `n >= 0`, and we have `n <= x`.
We can therefore reuse the function from Exercise 8.5.1:
```ocaml
let rec has_value f x l r =
  l <= r
  &&
  let m = (l + r) / 2 in
  let y = f m in
  if x < y then has_value f x l (m - 1)
  else if x > y then has_value f x (m + 1) r
  else true

let square x =
  has_value (fun n -> n * n) x 0 x
```

### 2.

We can use a variant of binary search:
```ocaml
let sqrt x =
  let rec helper l r =
    if l = r then l
    else begin
      let m = (l + r + 1) / 2 in (* rounded up *)
      let y = m * m in
      if x < y then helper l (m - 1)
      else helper m r
    end
  in
  helper 0 x
```

### 3.

We can adjust the above code for `sqrt`:
```ocaml
let inv f x =
  let rec helper l r =
    if l = r then l
    else begin
      let m = (l + r + 1) / 2 in (* rounded up *)
      let y = f m in
      if x < y then helper l (m - 1)
      else helper m r
    end
  in
  helper 0 x
```
