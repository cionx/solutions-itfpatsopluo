# Exercise 9.8.8

> Define a function `g : L(N) → N` such that the common divisors of the elements of a list `l` are exactly the divisors of `g(l)`.

---

We have for all integers `d, x1, ..., xn` the following sequence of equivalences:
```text
      d | x1  and   d | x2  and  d | x3  and  ...  and  d | xn
<==>  d | gcd(x1, x2)  and  d | x3  and  ...  and  d | xn
<==>  d | gcd(gcd(x1, x2), x3)  and  ...  and  d | xn
<==>  ...
```
We can therefore declare the function `g` as follows:
```text
           g : L(N) → N
           g [] := 0
          g [x] := x
g (x :: y :: l) := g ((gcd x y) :: l)
```
