# Exercise 11.3.1 (Array-based stacks as values)

> Array-based stacks can also be represented as values combining an array with a cell holding the current height of the stack.
> Modify the signature Stack from §11.2 such that make takes the maximal height of the stack object to be allocated as argument, and implement the signature with a structure such that all operations but make are constant time.
> Note that this approach provides a family of stack types where the element type can be freely chosen.

---

We use the following module signature:
```ocaml
module type STACK = sig
  type 'a stack
  exception Empty
  exception Full
  val make : int -> 'a -> 'a stack
  val push : 'a stack -> 'a -> unit
  val pop : 'a stack -> unit
  val top : 'a stack -> 'a
  val height : 'a stack -> int
end
```
We implement this signature with the following module:
```ocaml
module ArrayStack : STACK = struct
  type 'a stack = 'a array * int ref
  exception Empty
  exception Full

  let make h x : 'a stack =
    (Array.make h x, ref 0)

  let empty ((_, h) : 'a stack) =
    !h = 0

  let full ((a, h) : 'a stack) =
    !h = Array.length a

  let push ((a, h) : 'a stack) x =
    if full (a, h) then raise Full
    else a.(!h) <- x; h := !h + 1

  let pop ((a, h) : 'a stack) =
    if empty (a, h) then raise Empty
    else h := !h - 1

  let top ((a, h) : 'a stack) =
    if empty (a, h) then raise Empty
    else a.(!h - 1)

  let height ((_, h) : 'a stack) =
    !h
end
```
