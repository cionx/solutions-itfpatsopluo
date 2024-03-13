# Exercise 2.2.2

> Draw syntax trees for the following phrases:
> 1. `x + 3 · f(x) − 4`
> 2. `1 + (2 + (3 + 4))`
> 3. `1 + 2 + 3 + 4`
> 4. `1 + (2 + 3) + 4`
> 5. `1 + 2 · x − y · 3 + 4`
> 6. `(1 + 2) · x − (y · 3) + 4`
> 7. `if x < 3 then 3 else p(3)`
> 8. `let x = 2 + y in x − y`
> 9. `let p x n = if n > 0 then x · p x (n − 1) else 1 in p 2 10`

---

### 1.

The expression `x + 3 · f(x) − 4` is implicitly parenthesized as `(x + 3 · f(x)) − 4`.
We therefore get the following syntax tree:
```text
      -
     / \
    /   \
   +     4
  / \
 /   \
x     *
     / \
    /   \
   3     •
        / \
       /   \
      f     x
```

### 2.

The expression `1 + (2 + (3 + 4))` has the following syntax tree:
```text
   +
  / \
 /   \
1     +
     / \
    /   \
   2     +
        / \
       /   \
      3     4
```

### 3.

The expression `1 + 2 + 3 + 4` is implicitly parenthesized as `((1 + 2) + 3) + 4`.
Its syntax tree is therefore as follows:
```text
         +
        / \
       /   \
      +     4
     / \
    /   \
   +     3
  / \
 /   \
1     2
```

### 4.

The expression `1 + (2 + 3) + 4` is implicitly parenthesized as `(1 + (2 + 3)) + 4`.
Its syntax tree is therefore as follows:
```text
      +
     / \
    /   \
   +     4
  / \
 /   \
1     +
     / \
    /   \
   2     3
```

### 5.

The expression `1 + 2 · x − y · 3 + 4` is implicitly parenthesized as `((1 + 2 ⋅ x) - y ⋅ 3) + 4`.
Its syntax tree is therefore as follows:
```text
           +
          / \
         /   \
        -     4
       / \
      /   \
     /     \
    /       \
   +         *
  / \       / \
 /   \     /   \
1     *   y     3
     / \
    /   \
   2     x
```

### 6.

The expression `(1 + 2) · x − (y · 3) + 4` is implicitly parenthesized as `((1 + 2) · x − (y · 3)) + 4`.
Its syntax tree is therefore as follows:
```text
              +
             / \
            /   \
           -     4
          / \
         /   \
        /     \
       /       \
      *         *
     / \       / \
    /   \     /   \
   +     x   y     3
  / \
 /   \
1     2
```

### 7.

The expression `if x < 3 then 3 else p(3)` has the following syntax tree:
```text
   if-then-else
      / | \
     /  |  \
    /   |   \
   <    3    •
  / \       / \
 /   \     /   \
x     3   p     3
```

### 8.

The expression `let x = 2 + y in x − y` has the following syntax tree:
```text
        let
       / | \
      /  |  \
     /   |   \
    /    |    \
pattern  |     \
   |     |      \
   |     |       \
   x     +        -
        / \      / \
       /   \    /   \
      2     y  x     y
```


### 9.

The expression `let p x n = if n > 0 then x · p x (n − 1) else 1 in p 2 10` has the following syntax tree
```text
    ┌------------- let ---------------┐
    |               |                 |
    |               |                 |
 pattern       if-then-else           •
  / | \        /     \    \          / \
 /  |  \      /       \    \        /   \
p   x   n    >         *    1      •    10
            / \       / \         / \
           /   \     /   \       /   \
          n     0   x     •     p     2
                         / \
                        /   \
                       /     \
                      /       \
                     •         -
                    / \       / \
                   /   \     /   \
                  p     x   n     1
```
