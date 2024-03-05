# Exercise 4.16.2

> Decide for each of the following equations whether it
> is true in general.  
> a) $\mathit{lookup} \enspace (\mathit{update} \enspace l \enspace a \enspace b) \enspace a = \mathsf{Some} \enspace b$  
> b) $\mathit{lookup} \enspace (\mathit{update} \enspace l \enspace a' \enspace b) \enspace a = \mathit{lookup} \enspace l \enspace a$ if $a' \neq a$  
> c) $\mathit{update} \enspace (\mathit{update} \enspace l \enspace a \enspace b) \enspace a' \enspace b' = \mathit{update} \enspace (\mathit{update} \enspace l \enspace a' \enspace b') \enspace a \enspace b$ if $a \neq a'$  
> d) $\mathit{lookup} \enspace (\mathit{update} \enspace (\mathit{update} \enspace l \enspace a \enspace b) \enspace a' \enspace b') \enspace a = \mathsf{Some} \enspace b$ if $a \neq a'$

---

### a)

The equation is true:
```text
  lookup (update l a b) a
=
  lookup […, (a, b), …] a
=
  Some b
```

### b)

The equation is true.
To see this, we distinguish between two cases:

Case 1: $a$ already has a binding in $l$, say $(a, v)$.
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

Case 2: $a$ has no binding in $l$.
```text
  lookup (update l a' b) a
=
  lookup […, (a', b), …] a
=
  None
=
  lookup l a
```

### c)

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


### d)

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
