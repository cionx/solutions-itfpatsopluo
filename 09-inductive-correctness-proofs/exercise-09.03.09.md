# Exercise 9.3.9

> In this exercise we will write `|l|` for `length l` for better mathematical readability.
> Prove the following properties of the length of lists:
> 1. `|l1 @ l2|` = `|l1|` + `|l2|`.
> 2. `|rev l| = |l|`.
> 3. `|map f l| = |l|`.

---

We recall that `length` is recursively defined as follows:
```text
      length : ∀ α. L(α) → N
      length [] := 0
length (x :: l) := 1 + length l
```

### 1.

We show the proposed equality by induction over `l1`.

Base case:
```text
  |[] @ l2|
= |l2|          definition of @
= 0 + |l2|      algebra
= |[]| + |l2|   definition of length
```
Induction step:
```text
  |(x :: l1) @ l2|
= |x :: (l1 @ l2)|    definition of @
= 1 + |l1 @ l2|       definition of length
= 1 + |l1| + |l2|     induction hypothesis
= |x :: l1| + |l2|    definition of length
```

### 2.

We make the following observation:
```text
  |[x]|
= |x :: []|   definition of ( :: )
= 1 + |[]|    definition of length
= 1 + 0       definition of length
= 1           algebra
```

We show the proposed equality by induction over `l`.

Base case:
```text
  |rev []|
= |[]|      definition of rev
```
Induction step:
```text
  |rev (x :: l)|
= |rev l @ [x]|     definition of rev
= |rev l| + |[x]|   part 1 of this exercise
= |l| + |[x]|       induction hypothesis
= |l| + 1           observation
= 1 + |l|           algebra
= |x :: l|          definition of length
```

### 3.

We show the proposed equality by induction over `l`.

Base case:
```text
  |map f []|
= |[]|        definition of map
```
Induction step:
```text
  |map f (x :: l)|
= |f x :: map f l|    definition of map
= 1 + |map f l|       definition of length
= 1 + |l|             induction hypothesis
= |x :: l|            definition of length
```
