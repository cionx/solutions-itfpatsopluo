# Exercise 11.3.2

> Assume a structure `S : BSTACK`.
> 1. Declare a function `toList : unit → L(int)` that yields the state of the stack `S` as a list with the most recent entry appearing first.
> 2. Declare a function `ofList : L(int) → unit` that updates the state of the stack `S` to the sequence given by the list.
>    Use only operations declared in the signature `BSTACK`.
>    OCaml’s type checking will ensure this if `S` is declared with signature `BSTACK`.
>
> As an interesting variant, extend the signature `BSTACK` with the operations `toList` and `ofList` so that they can be implemented within the structure with constant running time.

---

### 1. and 2.

We use auxiliary functions that pops/reads the entire stack into a list, and that pushes an entire list of values onto the stack:
```ocaml
(** [pushList l] pushes the list [l] onto the stack, with the head first. *)
let rec pushList l = match l with
  | [] -> ()
  | x :: l -> S.push x; pushList l

(** [readList ()] pops and reads the entire stack into a list; the top of the
    stack is the last entry in the list. *)
let rec readList () =
  let rec loop acc = 
    if S.empty () then acc
    else let x = S.top () in S.pop (); loop (x :: acc)
  in
  loop []
```

We now declare `toList` and `ofList` as follows:
```ocaml
(** [toList ()] as the current state of the stack as a list, with the top of the
    stack as the head of the list. *)
let toList () =
  let l = readList () in
  pushList l;
  List.rev l

(** [ofList l] sets the state of the stack to [l], with the head of [l] as the
    top of the stack. *)
let ofList l =
  let _ = readList () in
  pushList (List.rev l)
```
These declarations are chosen so that `ofList l; toList ()` yields `l`.

### Variant

We need to convert the internally used array `a` into a list, or overwrite `a` with the contents of a list.
We don’t see how this is supposed to be doable in constant time.
