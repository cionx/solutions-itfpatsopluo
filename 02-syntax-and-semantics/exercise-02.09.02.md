# Exercise 2.9.2 (Tuple patterns)

> The translation rule for tuple patterns in Figure 2.5 is just given for pairs so that the translation fits into one line.
> Give the translation rule for triples.
> Try to give the translation rule for general patterns using the dots notation `(...)`.

---

We have the following translation rule for triples:
```text
  let (x, y, z) = e1 in 2
→ let a = e1 in let x = π1 a in let y = π2 a in let z = π3 a in e2
```

For general tuples we have the following translation rule:
```text
  let (x1, ..., xn) = e1 in e2
→ let a = e1 in let x1 = π1 a in let ... xn = πn a in e2
```
