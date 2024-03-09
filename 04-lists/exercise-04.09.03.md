# Exercise 4.9.3 (Maximal element)

> Declare a function that yields the maximal element of a list of numbers.
> If the list is empty, a failure exception should be raised.

---

We use an auxiliary function $\mathit{maximum}'$ that keeps track of the largest element we have encountered so far.
```ocaml
let rec maximum' l m =
  match l with
  | [] -> m
  | x :: l -> maximum' l (max x m)

let maximum l =
  match l with
  | [] -> failwith "maximum"
  | x :: l -> maximum' l x
```
