# List prefixes 8P

> Declare a polymorphic function `pre` that given a list yields a list containing all prefixes of the list.
> For instance, `pre [1, 2, 3] = [[], [1], [1, 2], [1, 2, 3]]`.

---

We can declare the function `pre` as follows:
```ocaml
let rec pre l = match l with
  | [] -> [[]]
  | x :: l -> [] :: List.map (List.cons x) (pre l)
```
