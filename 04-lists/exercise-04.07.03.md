# Exercise 4.7.3

> Define a function `pos : ∀ α. L(α) → Z → B` testing whether a number is a position of a list.

---

The valid positions for a list of length `n` are `0, 1, ..., n - 1`:
```text
    pos : ∀ α. L(α) → Z → B
pos l n := n >= 0 && n < len l
```
In OCaml:
```ocaml
let pos l n =
  n >= 0 && n < List.length l
```
