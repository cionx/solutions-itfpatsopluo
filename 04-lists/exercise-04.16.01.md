# Exercise 4.16.1

> Give the values of the following expressions:
> 1. `update (update (update [] "x" 7) "y" 2) "z" 5`
> 2. `lookup (update l "x" 13) "x"`
> 3. `lookup (update l a 7) a`

---

### 1.

The expression evaluates as follows:
```text
  update (update (update [] "x" 7) "y" 2) "z" 5
->
  update (update [("x", 7)] "y" 2) "z" 5
->
  update [("x", 7), ("y", 2)] "z" 5
->
  [("x", 7); ("y", 2); ("z", 5)]
```

### 2.

The expression evaluates as follows:
```text
  lookup (update l "x" 13) "x"
->
  lookup […, ("x", 13), …] "x"
->
  Some 13
```

### 3.

The expression evaluates as follows:
```text
  lookup (update l a 7) a
->
  lookup […, (a, 7), …] a
->
  Some 7
```
