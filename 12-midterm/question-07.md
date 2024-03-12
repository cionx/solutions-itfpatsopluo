# Insertion sort 8P

> Declare a polymorphic function `sort` sorting lists following the insertion sort algorithm.
> For instance, `sort [5, 3, 2, 3, 2] = [2, 2, 3, 3, 5]`.

---

We can declare the function `sort` as follows:
```ocaml
let rec insert x l =
  match l with
  | [] -> [x]
  | y :: l ->
    if x <= y then x :: y :: l else y :: (insert x l)

let sort l =
  let rec loop l acc = match l with
    | [] -> acc
    | x :: l -> loop l (insert x acc)
  in
  loop l []
```
