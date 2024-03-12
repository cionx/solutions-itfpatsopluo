# Exercise 11.6.2

> Given an expression allocating a circular list `[1, 2, ...]` as shown in §11.5 in the heap `H`.

---

We can allocate this circular list as follows:
```ocaml
let a' = alloc' [2; -1]
let a = alloc' [1; a']
let _ = H.set a' 1 a
```
The head of the circular list as now at address `a`.

To check our code we can use the following auxiliary function:
```ocaml
(** [getclist n a] are the first [n] entries of a circular list saved at [a]. *)
let rec getclist n a =
  if n <= 0 then []
  else H.get a 0 :: getclist (n - 1) (H.get a 1)
```
The result seems correct:
```ocaml
# getclist 10 a;;
- : int list = [1; 2; 1; 2; 1; 2; 1; 2; 1; 2]
```
