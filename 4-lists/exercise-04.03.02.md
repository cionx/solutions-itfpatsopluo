# Exercise 4.3.2 (Init)

> Declare a polymorphic function $\mathit{init}$ such that $\mathit{init} \; n \; f = [f(0), \dotsc , f(n − 1)]$ for $n \geq 0$.
> Note that $n$ is the length of the result list.
> Write your function with a tail-recursive helper function.
> Make sure your function agrees with OCaml’s predefined function $\mathit{List.init}$.
> Use $\mathit{List.init}$ to declare polymorphic functions that yield lists
> $[f(m), f(m + 1), \dotsc , f(m + n − 1)]$ and $[f(m), f(m + 1), \dotsc , f(n)$].

---

We can declare $\mathit{init}$ as follows:
```ocaml
let rec init_aux n f acc =
  if n < 0 then acc
  else init_aux (n - 1) f (f n :: acc)

let init n f =
  init_aux n f []
```

We can declare the other two functions as follows:
```ocaml
let init' m n f =
  List.init n (fun k -> f (m + k))

let init'' m n f =
  init' m (n - m + 1) f
```
