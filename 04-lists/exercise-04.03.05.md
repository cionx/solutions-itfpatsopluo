# Exercise 4.3.5

> Declare functions
> ```text
>   zip : ∀ α β. L(α) → L(β) → L(α × β)
> unzip : ∀ α β. L(α × β) → L(α) × L(β)
> ```
> such that
> ```text
>   zip [x1, ..., xn] [y1, ..., yn] = [(x1, y1), ..., (xn, yn)]
> unzip [(x1, y1), ..., (xn, yn)] = ([x1, ..., xn], [y1, ..., yn])
> ```

---

We can declare these two functions as follows:
```ocaml
let rec zip xs ys =
  match xs, ys with
  | [], [] -> []
  | x :: xs', y :: ys' ->
    (x, y) :: zip xs' ys'
  | _ -> invalid_arg "zip: different list lengths"

let rec unzip pairs =
  match pairs with
  | [] -> [], []
  | p :: ps ->
    let x, y = p in
    let xs, ys = unzip ps in
    (x :: xs, y :: ys)
```
