# Exercise 10.8.7

> Implement cells with arrays using the identifiers _cell_, _alloc_, _get_, and _set_.

---

We implement cells as arrays of length 1.
```ocaml
type 'a cell = 'a array
let alloc x = [| x |]
let get c = c.(0)
let set c x = c.(0) <- x
```
