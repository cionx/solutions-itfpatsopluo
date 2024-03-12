# Prime numbers 10P

> Recall the sequence of prime numbers: `2, 3, 5, 7, 11, ...`
>
> 1. Declare a function `prime : int → bool` testing primality.
> 2. Declare a function `enum : unit → int` enumerating the sequence of prime numbers.
>
> You may use the function `first.`

---

### 1.

We can declare the function `prime` as follows:
```ocaml
let prime x =
  let rec loop k x =
    if k * k > x then true
    else if x mod k = 0 then false
    else loop (k + 1) x
  in
  x >= 2 && loop 2 x
```

### 2.

We can declare the function `enum` as follows:
```ocaml
let enum =
  let num = ref 1 in
  fun () ->
    num := first prime (!num + 1);
    !num
```
