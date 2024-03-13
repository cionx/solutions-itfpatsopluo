# Sorting and removing duplicates 12P

> Declare a function `sortRem : ∀ α. L(α) → L(α)` that sorts a list and removes duplicates.
> For instance, `sortRem [3, 2, 3, 4, 2] = [2, 3, 4]`.
> Follow the insertion sort algorithm.

---

We can declare the function `sortRem` as follows:
```ocaml
let rec insert x l = match l with
  | [] -> [x]
  | y :: l ->
    if x < y then x :: y :: l
    else if x > y then y :: (insert x l)
    else y :: l

let sortRem l =
  let rec loop l acc = match l with
    | [] -> acc
    | x :: l -> loop l (insert x acc)
  in
  loop l []
```
