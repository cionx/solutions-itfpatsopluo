# AB-tree infix linearization 8P

> Declare a function `lin` linearizing AB-trees such that `B` is treated as a left-associative infix operator. For instance, `lin(B(B(A, A), B(A, A))) = "ABAB(ABA)"`.

---

We can declare the function `lin` as follows:
```ocaml
let rec lin t = match t with
  | A -> "A"
  | B (t1, t2) -> lin t1 ^ "B" ^ plin t2
and plin t = match t with
  | A -> "A"
  | t -> "(" ^ lin t ^ ")"
```
