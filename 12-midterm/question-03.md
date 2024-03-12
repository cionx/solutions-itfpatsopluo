# List reversal 8P

> Declare a polymorphic function `rev` reversing lists.
> For instance, `rev [1, 2, 3] = [3, 2, 1]`.
> Use only tail recursion.
> Do not use list concatenation `@`.

---

We can declare `rev` as follows:
```ocaml
let rev l =
  let rec loop l acc =
    match l with
    | [] -> acc
    | x :: l -> loop l (x :: acc)
  in
  loop l []
```
