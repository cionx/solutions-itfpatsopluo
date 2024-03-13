# Exercise 4.15.4

> Dieter Schlau has simplified the naive prime factorization function:
> ```ocaml
> let rec prime_fac x =
>   if x < 2 then []
>   else let k = first (fun k -> x mod k = 0) 2 in
>     k :: prime_fac (x / k)
> ```
> Explain why Dieter’s function is correct.

---

If `k = x`, then instead of directly returning `[x]` we will now get the following trace:
```text
  k :: prime_fac (x / k)
=
  k :: prime_fac 1
=
  k :: []
=
  [k]
=
  [x]
```
So we end up with the same result.
