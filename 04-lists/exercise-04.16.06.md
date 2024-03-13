# Exercise 4.16.6 (Maps as functions)

> Maps can be realized with functions if all maps are constructed from the empty map
> ```text
> empty : ∀ α β . map α β
> ```
> with update and the only thing that matters is that lookup yields the correct results.
> Assume the definition
> ```text
> map α β := α → Some β
> ```
> and define empty and the operations update and lookup accordingly.
> Test your solution with
> ```text
> lookup (update (update (update empty "y" 7) "x" 2) "y" 5) "y" = Some 5
> ```
> Note that you can still define the operations bound and delete from Exercises 4.16.1 and 4.16.2.

---

We represent a map of type `map α β` as a function `m` of type `α → O(β)` such that `m a` is the value associated to the key `a`.
If no such value exists, then `None` is returned instead.

The empty map is therefore the function that returns `None` for every input:
```text
empty : ∀ α β. α → O(β)
empty a := None
```
In OCaml code:
```ocaml
let empty _ =
  None
```

Looking up a value is done by function evaluation:
```text
lookup : ∀ α β. map α β → α → O(β)
lookup m a := m a
```
In OCaml code:
```ocaml
let lookup m a =
  m a
```

We can update a map with a new binding as follows:
```text
 update : ∀ α β. map α β → α → β → map α β
(update m a b) a' := if a = a' then Some b else m a'
```
In OCaml code:
```ocaml
let update m a b a' =
  if a = a' then Some b else m a'
```

We can now test the given example in utop:
```ocaml
# let m = update (update (update empty "y" 7) "x" 2) "y" 5;;
val t : string -> int option = <fun>

# lookup m "y";;
- : int option = Some 5
```
