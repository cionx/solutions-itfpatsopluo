# Prefix linearization 13P

> We consider AB-trees and their prefix linearization following the grammar `tree ::= "A" | "B" tree tree`.
> We assume the type declarations
> ```ocaml
> type tree = A | B of tree * tree
> type token = AT | BT
> ```
> 1. Declare a function `lin : tree → L(token)` computing the prefix linearization of AB-trees.
>    For instance, `lin (B(A, B(A, A))) = [BT, AT, BT, AT, AT]`.
> 2. Declare a function `par : L(token) → tree` parsing the prefix linearization of AB-trees.
>    We want `par (lin t) = t` for all AB-trees `t`.
>    If `l` is not a prefix linearization of an AB-tree, `par` should raise an exception with `failwith "par"`.
>    For instance, `par` should raise an exception on `[AT, AT]`.

---

### 1.

We can declare the function `lin` as follows:
```ocaml
let rec lin t = match t with
  | A -> [AT]
  | B (t1, t2) ->
    BT :: lin t1 @ lin t2
```

### 2.

We can declare the function `par` as follows:
```ocaml
let rec tree l = match l with (* L(token) -> tree * L(token) *)
  | [] -> failwith "par"
  | AT :: l -> (A, l)
  | BT :: l ->
    let t1, l = tree l in
    let t2, l = tree l in
    (B (t1, t2), l)

let par l =
  match tree l with
  | (t, []) -> t
  | _ -> failwith "par"
```
