# Exercise 6.3.1

> Declare a parser for ABC-trees where B and C are left-associative infix operators at the same precedence level.

---

We only have to add the following case to the function `tree'`:
```ocaml
  | CT :: l ->
    let (t', l) = ptree l in
    tree' (C (t, t')) l
```
