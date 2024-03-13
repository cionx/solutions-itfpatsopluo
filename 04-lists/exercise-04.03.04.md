# Exercise 4.3.4 (Decimal Numbers)

> With lists we have a mathematical representation for decimal numbers.
> For instance, the decimal representation for the natural number `1234` is the list `[1, 2, 3,4]`.
> 1. Declare a function `dec : N → L(N)` that yields the decimal number for a natural number.
>    For instance, we want `dec 1324 = [1, 3, 2, 4]`.
> 2. Declare a function `num : L(N) → N` that converts decimal numbers into numbers:
>    `num (dec n) = n`.
>    Hint:
>    Declare `num` with a tail-recursive function `num'` such that, for instance:
>    ```text
>    num [1, 2, 3] = num' [1, 2, 3] 0
>                  = num' [2, 3] 1
>                  = num' [3] 12
>                  = num' [] 123
>                  = 123
>    ```

---

### 1.

We can declare the function `dec` as follows:
```ocaml
let rec dec' n acc =
  if n = 0 then acc
  else dec' (n / 10) ((n mod 10) :: acc)

let dec n =
  dec' n []
```

### 2.

We can declare the function `num` as follows:
```ocaml
let rec num' digits acc =
  match digits with
  | [] -> acc
  | d :: ds -> num' ds (10 * acc + d)

let num digits =
  num' digits 0
```
