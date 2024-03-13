# Exercise 4.5.4

> Declare a function `count : ∀ α. α → L(α) → N` that counts how often a value appears in a list.
> For instance, we want `count 5 [2, 5, 3, 5] = 2`.

---

We use an auxiliary function `count'` that keeps track of how often we have encountered the searched-for element:
```text
       count' : ∀ α. α → L(α) → N → N
       count' x [] a := a
count' x (x' :: l) a := count' x l (if x = x' then a + 1 else a)
```
We can then express `count` in terms of `count'`:
```text
count x l := count' x l 0
```

In OCaml code:
```ocaml
let rec count' x l acc =
  match l with
  | [] -> acc
  | x' :: l -> count' x l (if x' = x then acc + 1 else acc)

let count x l =
  count' x l 0
```
