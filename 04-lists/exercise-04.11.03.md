# Exercise 4.11.3

> We have the equations
> ```text
> foldl f l b = fold f (rev l) b
> fold f l b = foldl f (rev l) b
> ```
> 1. Show that the second equation follows from the first equation using the equation `rev (rev l)) = l`.
> 2. Obtain `fold` from `foldl` not using recursion.
> 3. Obtain `foldl` from `fold` not using recursion.

---

### 1.

It follows from the first equation and the identity `l = rev (rev l)` that
```text
  fold f l b
= fold f (rev (rev l)) b
= foldl f (rev l) b .
```

### 2.

We can use the second formula.

### 3.

We can use the first formula.
