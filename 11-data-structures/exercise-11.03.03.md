# Exercise 11.3.3

> Extend signature `BSTACK` and structure `S` with an operation `height : unit → int` that yields the current height of the stack.

---

We only have to extend the signature `BSTACK` with the following line:
```ocaml
  val height : unit -> int
```
The structure `S` then needs to be extended with the following line:
```ocaml
  let height () = !h
```
