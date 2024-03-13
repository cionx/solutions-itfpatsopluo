# Exercise 4.11.2

> Using `foldl`, declare functions that yield the length, the reversal, and the concatenation of lists.

---

We can use the following formulas:
```text
    length l = foldl (λ x a. 1 + a) l 0
       rev l = foldl (λ x a. x :: a) l []
concat l1 l2 = foldl (λ x a . a @ [x]) l2 l1
```
In OCaml code:
```ocaml
let length l = foldl (fun x a -> 1 + a) l 0

let rev l = foldl (fun x a -> x :: a) l []

let concat l1 l2 = foldl (fun x a -> a @ [x]) l2 l1
```
