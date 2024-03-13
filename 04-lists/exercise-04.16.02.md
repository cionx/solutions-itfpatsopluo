# Exercise 4.16.2

> Decide for each of the following equations whether it is true in general.
> 1. `lookup (update l a b) a = Some b`
> 2. `lookup (update l a' b) a = lookup l a` if `a' <> a`
> 3. `update (update l a b) a' b' = update (update l a' b') a b` if `a <> a'`
> 4. `lookup (update (update l a b) a' b') a = Some b` if `a <> a'`

---

### 1.

The equation is true:
```text
  lookup (update l a b) a
=
  lookup […, (a, b), …] a
=
  Some b
```

### 2.

The equation is true.
To see this, we distinguish between two cases:

Case 1: `a` already has a binding in `l`, say `(a, v)`.
```text
  lookup (update l a' b) a
=
  lookup (update […, (a, v), …] a' b) a
=
  lookup […, (a, v), …, (a', b), …] a
=
  v
=
  lookup […, (a, v), …] a
=
  lookup l a
```

Case 2: `a` has no binding in `l`.
```text
  lookup (update l a' b) a
=
  lookup […, (a', b), …] a
=
  None
=
  lookup l a
```

### 3.

The equation is false:
As a counterexample, consider the following:
```
  update (update [] "a" 1) "b" 2
=
  update [("a", 1)] "b" 2
=
  update [("a", 1); ("b", 2)]
<>
  update [("b", 2); ("a", 1)]
=
  update [("b", 2)] "a" 1
=
  update (update [] "b" 2) "a" 1
```
However, the two sides of the proposed equation are always equal up to permutation, and thus extensionally equal.


### 4.

The equation is true:
```text
  lookup (update (update l a b) a' b') a
=
  lookup (update […, (a, b), …] a' b') a
=
  lookup […, (a, b), …, (a', b'), …] a
=
  Some b
```
