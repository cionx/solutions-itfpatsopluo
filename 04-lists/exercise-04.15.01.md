# Exercise 4.15.1

> Give traces for the following applications:  
> a) $\mathit{prime\_fac}' \enspace 2 \enspace 7$  
> b) $\mathit{prime\_fac}' \enspace 2 \enspace 8$  
> c) $\mathit{prime\_fac}' \enspace 2 \enspace 15$

---

### a)

We have the following trace:
```text
  prime_fac' 2 7
=                             2 * 2 <= 7 and 7 % 2 <> 0
  prime_fac' 3 7
=                             3 * 3 > 7
  [7]
```

### b)

We have the following trace:
```text
  prime_fac' 2 8
=                             2 * 2 <= 8 and 8 % 2 = 0 and 8 / 2 = 4
  2 :: prime_fac' 2 4
=                             2 * 2 <= 4 and 4 % 2 = 0 and 4 / 2 = 2
  2 :: 2 :: prime_fac' 2 2
=                             2 * 2 > 2
  2 :: 2 :: [2]
=
  2 :: [2; 2]
=
  [2; 2; 2]
```

### c)

We have the following trace:
```text
  prime_fac' 2 15
=                             2 * 2 <= 15 and 15 % 2 <> 0
  prime_fac' 3 15
=                             3 * 3 <= 15 and 15 % 3 = 0 and 15 / 3 = 5
  3 :: prime_fac' 3 5
=                             3 * 3 > 5
  3 :: [5]
=
  [3; 5]
```
