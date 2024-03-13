# Exercise 5.4.1

> Declare a function linearizing AB-trees by treating `B` as a right-associative syntactic operator.
> For instance, we want `B(A, B(A, A)) → "ABABA"`.

---

We can declare the desired function as follows:
```text
         tree A := "A"
 tree B(t1, t2) := ptree t1 ^ "B" ^ tree t2
        ptree A := "A"
ptree B(t1, t2) := "(" ^ tree B(t1, t2) ^ ")"
```
In OCaml code:
```ocaml
let rec tree t =
  match t with
  | A -> "A"
  | B (t1, t2) -> ptree t1 ^ "B" ^ tree t2
and ptree t =
  match t with
  | A -> "A"
  | B (_, _) -> "(" ^ tree t ^ ")"
```
