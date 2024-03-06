# Exercise 6.2.1

> Declare recursive descent parsers for ABC-trees in prefix linearization.

---

We can implement such a parser as follows:
```ocaml
let rec parse l =
  match l with
  | AT :: l -> (A, l)
  | BT :: l ->
    let (t1, l) = parse l in
    let (t2, l) = parse l in
    (B (t1, t2), l)
  | CT :: l ->
    let (t1, l) = parse l in
    let (t2, l) = parse l in
    (C (t1, t2), l)
  | _ -> failwith "tree"
```
