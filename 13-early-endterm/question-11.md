# Decimal representation 12P

> 1. Declare a function `dec : N → L(N)` computing the decimal representation of `x`.
>    For instance, `dec 453 = [4, 5, 3]`.
>    Use only tail recursion.
> 2. Declare a function `num : array (int) → int` converting a decimal representation stored in an array into the number represented.
>    For instance, we want `undec [|5; 6; 2|] = 562`.
>    Use only tail recursion.

---

### 1.

We can declare the function `dec` as follows:
```ocaml
let dec x =
  let rec loop x acc =
    if x = 0 then acc
    else loop (x / 10) ((x mod 10) :: acc)
  in
  loop x []
```

### 2.

We can declare the function `num` as follows:
```ocaml
let num arr =
  let rec loop i acc =
    if i >= Array.length arr then acc
    else loop (i + 1) (10 * acc + arr.(i))
  in
  loop 0 0
```
