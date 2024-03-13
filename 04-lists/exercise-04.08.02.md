# Exercise 4.8.2

> Declare a function
> ```text
> nth_list : ∀ α. L(α) → int → L(α)
> ```
> that agrees with `nth_opt` but returns a list with at most one element.

---

We can implement `nth_list` the same way as `nth_opt`:
```ocaml
let rec nth_opt l n =
  match l with
  | [] -> []
  | x :: l -> if n < 1 then [x] else nth_opt l (n-1)
```
