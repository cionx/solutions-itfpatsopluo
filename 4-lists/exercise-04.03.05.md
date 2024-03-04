# Exercise 4.3.5

> Declare functions
> $$
>   \begin{aligned}
>     \mathit{zip}   &: \forall \alpha \beta. \; \mathcal{L}(\alpha) \to \mathcal{L}(\beta) \to \mathcal{L}(\alpha \times \beta) \,, \\
>     \mathit{unzip} &: \forall \alpha \beta. \; \mathcal{L}(\alpha \times \beta) \to \mathcal{L}(\alpha) \times \mathcal{L}(\beta) \,,
>   \end{aligned}
> $$
> such that
> $$
>   \begin{aligned}
>     \mathit{zip} \; [x_1, \dotsc, x_n ] \; [y_1, \dotsc, y_n ] &= [(x_1, y_1 ), \dotsc, (x_n, y_n )] \,, \\
>     \mathit{unzip} \; [(x_1, y_1), \dotsc, (x_n, y_n)] &= ([x_1, \dotsc, x_n], [y_1, \dotsc, y_n]) \,.
>   \end{aligned}
> $$

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
