# Exercise 2.2.2

> Draw syntax trees for the following phrases:
> a) `x + 3 · f(x) − 4`
> b) `1 + (2 + (3 + 4))`
> c) `1 + 2 + 3 + 4`
> d) `1 + (2 + 3) + 4`
> e) `1 + 2 · x − y · 3 + 4`
> f) `(1 + 2) · x − (y · 3) + 4`
> g) `if x < 3 then 3 else p(3)`
> h) `let x = 2 + y in x − y`
> i) `let p x n = if n > 0 then x · p x (n − 1) else 1 in p 2 10`

---

### a)

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

### b)

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

### c)

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

### d)

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

### e)

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

### f)

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

### g)

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

### h)

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


### i)
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
