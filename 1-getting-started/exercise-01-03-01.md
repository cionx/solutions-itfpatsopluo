# Exercise 1.3.1

> Declare minimum functions analogous to the maximum functions declared above.
> For each declared function give its type (before you check it with the interpreter).
> Also, write the declarations with and without redundant parentheses to understand the nesting.

---

We can declare the binary minimum function as follows:
```ocaml
let min x y : int = if x <= y then x else y
```
This function is of type $\mathit{int} \to \mathit{int} \to \mathit{int}$.

The trinary minimum function can be declared in the following ways:
```ocaml
let min3 x y z = min (min x y) z

let min3' x y z : int =
  let a = if x <= y then x else y in
  if a <= z then a else z

let min3'' x y z : int =
  let a = (if x <= y then x else y) in
  (if a <= z then a else z)
```
These functions are of type $\mathit{int} \to \mathit{int} \to \mathit{int} \to \mathit{int}$.
