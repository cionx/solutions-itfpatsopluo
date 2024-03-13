# Exercise 5.2.2

> Define and declare a function `breadth : tree → N` that yields the number of leaves a tree has.

---

We can declare this function as follows:
```
        breadth : tree → N
        breadth A :=  1
breadth B(t1, t2) := breadth t1 + breadth t2
```
In OCaml code:
```ocaml
let rec breadth t =
  match t with
  | A -> 1
  | B (t1, t2) -> breadth t1 + breadth t2
```
