# Exercise 4.10.4

> Declare a function `filter : ∀ α. (α → B) → L(α) → L(α)` that given a test and a list yields the sublist of all elements that pass the test.
> For instance, we want `filter (λ x. x > 2) [2, 5, 1, 5, 2] = [5, 5]`.

---

We can declare the function `filter` as follows:
```text
      filter : ∀ α. (α → B) → L(α) → L(α)
      filter p [] := []
filter p (x :: l) := if p x then x :: (filter p l) else filter p l
```
In OCaml code:
```ocaml
let rec filter p l =
  match l with
  | [] -> []
  | x :: l ->
    let l' = filter p l in
    if p x then x :: l' else l'
```
