# Exercise 4.16.4 (Deletion)

> Declare a function
> ```text
> delete : ∀ α β. map α β → α → map α β
> ```
> deleting the entry for a given key.
> We want `lookup (delete l a) a = None` for all environments `l` and all keys `a`.

---

We can declare `delete` as follows:
```text
             delete : ∀ α β. map α β → α → map α β
             delete [] a := []
delete ((a', b') :: m) a := if a = a' then m else (a', b') :: (delete m a)
```
In OCaml code:
```ocaml
let rec delete m a =
  match m with
  | [] -> []
  | (a', b') :: m ->
    if a = a' then m else (a', b') :: delete m a
```
