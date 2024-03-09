# Exercise 4.16.1

> Give the values of the following expressions:  
> a) $\mathit{update} \enspace (\mathit{update} \enspace (\mathit{update} \enspace [\,] \enspace \mathtt{"x"} \enspace 7) \enspace \mathtt{"y"} \enspace 2) \enspace \mathtt{"z"} \enspace 5$  
> b) $\mathit{lookup} \enspace (\mathit{update} \enspace l \enspace \mathtt{"x"} \enspace 13) \enspace \mathtt{"x"}$  
> c) $\mathit{lookup} \enspace (\mathit{update} \enspace l \enspace a \enspace 7) \enspace a$

---

### a)

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

### b)

The expression evaluates as follows:
```text
  lookup (update l "x" 13) "x"
->
  lookup […, ("x", 13), …] "x"
->
  Some 13
```

### c)

The expression evaluates as follows:
```text
  lookup (update l a 7) a
->
  lookup […, (a, 7), …] a
->
  Some 7
```
