# Fibonacci numbers 6P

> Declare a constant-time function `enum : unit → int` enumerating the sequence of Fibonacci numbers:
> ```text
>       fib 0 := 0
>       fib 1 := 1
> fib (n + 1) := fib n + fib (n + 1)
> ```

---

We can declare the function `enum` as follows:
```ocaml
let enum =
  let state = ref (0, 1) in
  fun () ->
    let a, b = !state in
    state := (b, a + b);
    a
```
