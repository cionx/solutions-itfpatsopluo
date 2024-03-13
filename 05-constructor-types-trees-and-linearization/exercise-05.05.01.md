# Exercise 5.5.1

> Declare functions that for ABC-trees yield
> 1. the prefix linearization.
> 2. the postfix linearization.
> 3. the fully parenthesized infix linearization.

---

### 1.

We can declare the function `prefix` as follows:
```text
        prefix : tree → string
        prefix A := "A"
prefix B(t1, t2) := "B" ^ prefix t1 ^ prefix t2
prefix C(t1, t2) := "C" ^ prefix t1 ^ prefix t2
```
In OCaml code:
```ocaml
let rec prefix t =
  match t with
  | A -> "A"
  | B (t1, t2) -> "B" ^ prefix t1 ^ prefix t2
  | C (t1, t2) -> "C" ^ prefix t1 ^ prefix t2
```

### 2.

We can declare the function `postfix` as follows:
```text
        postfix : tree → string
        postfix A := "A"
postfix B(t1, t2) := postfix t1 ^ postfix t2 ^ "B"
postfix C(t1, t2) := postfix t1 ^ postfix t2 ^ "C"
```
In OCaml code:
```ocaml
let rec postfix t =
  match t with
  | A -> "A"
  | B (t1, t2) -> postfix t1 ^ postfix t2 ^ "B"
  | C (t1, t2) -> postfix t1 ^ postfix t2 ^ "C"
```

### 3.

We can declare the function `infix` as follows:
```text
        infix : tree → string
        infix A := "A"
infix B(t1, t2) := "(" ^ infix t1 ^ "B" ^ infix t2 ^ ")"
infix C(t1, t2) := "(" ^ infix t1 ^ "C" ^ infix t2 ^ ")"
```
In OCaml code:
```ocaml
let rec infix t =
  match t with
  | A -> "A"
  | B (t1, t2) -> "(" ^ (infix t1) ^ "B" ^ (infix t2) ^ ")"
  | C (t1, t2) -> "(" ^ (infix t1) ^ "C" ^ (infix t2) ^ ")"
```
