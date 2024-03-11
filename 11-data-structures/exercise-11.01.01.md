# Exercise 11.1.1

> Implement the signature `CELL` with OCaml’s predefined reference cells.

---

We get the following implementation:
```ocaml
module Cell : CELL = struct
  type 'a cell = 'a ref
  let make x = ref x
  let get c = !c
  let set c x = c := x
end
```
