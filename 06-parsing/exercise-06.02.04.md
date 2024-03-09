# Exercise 6.2.4

> Declare a function checking that a string consists of balanced parentheses only.
> For instance, $((()())()())$ is fine but $((()())$ is not.

---

We can iterate over the string while keeping track of how nested the expression currently is.
```ocaml
let balanced s =
  let n = String.length s in
  let rec iter i depth =
    if i >= n then depth = 0
    else if depth < 0 then false
    else match String.get s i with
      | '(' -> iter (i + 1) (depth + 1)
      | ')' -> iter (i + 1) (depth - 1)
      | _ -> failwith "balanced: illegal character"
  in
  iter 0 0
```
