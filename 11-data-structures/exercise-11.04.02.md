# Exercise 11.4.2

> Assume a structure `Q : BQUEUE`.
>
> 1. Declare a function `toList : unit → L(int)` that yields the state of the queue `Q` as a list with the most recent entry appearing first.
> 2. Declare a function `ofList : L(int) → unit` that updates the state of the queue `Q` to the sequence given by the list.
>
> Use only operations declared in the signature `BQUEUE.`
> OCaml’s type checking will ensure this if `Q` is declared with signature `BQUEUE.`
>
> As an interesting variant, extend the signature `BQUEUE` with the operations `toList` and `ofList` so that they can be implemented within the structure with constant running time.

---

### 1. and 2.

We use the same approach as for Exercise 11.3.2.

```ocaml
(** [readList] reads/removes all entries of the queue into a list. The most
    recent entries appear first. *)
let readList () =
  let rec loop acc =
    if Q.empty () then acc
    else
      let x = Q.first () in
      Q.remove ();
      loop (x :: acc)
  in
  loop []

(** [insertList l] inserts all entries of the list [l] into the queue. The
    first entry of [l] is inserted first. *)
let rec insertList l = match l with
  | [] -> ()
  | x :: l -> Q.insert x; insertList l

(** [toList ()] is a list containing the entries of the queue. The first entry
    of the queue appears first in the list. *)
let toList () =
  let l = readList () in
  insertList (List.rev l);
  l

(** [ofList l] sets the state of the queue to the list [l]. The first entry of
    [l] is becomes the latest entry of the queue. *)
let ofList l =
  let _ = readList () in
  insertList (List.rev l)
```
We chose the convention for `ofList` such that `ofList l; toList ()` returns `l`.

### Variant

As in Exercise 11.3.2 we don’t know how this is possible.
