# Exercise 1.5.3 (Traces)

> Give traces for the following applications:
> ```ocaml
>  rev' 678 0
>  rev' 6780 0
>  gcd 90 120
>  gcd 153 33
>  my_mod 17 5
> ```
> We remark that the functions `rev'`, `gcd`, and `my_mod` employ a special form of recursion known as tail recursion.
> We will discuss tail recursion in §1.11.

---

The trace for `rev' 678 0` is as follows:
```ocaml
  rev' 678 0
= rev' 67 8
= rev' 6 87
= rev' 0 876
= 876
```

The trace for `rev' 6780` is as follows:
```ocaml
  rev' 6780 0
= rev' 678 0
= rev' 67 8
= rev' 6 87
= rev' 0 876
= 876
```

The trace for `gcd 90 120` is as follows:
```ocaml
  gcd 90 120
= gcd 120 90
= gcd 90 30
= gcd 30 0
= 30
```

The trace for `gcd 153 33` is as follows:
```ocaml
  gcd 153 33
= gcd 33 21
= gcd 21 12
= gcd 12 9
= gcd 9 3
= gcd 3 0
= 3
```

The trace for `my_mod 17 5` is as follows:
```ocaml
  my_mod 17 5
= my_mod 12 5
= my_mod 7 5
= my_mod 2 5
= 2
```
