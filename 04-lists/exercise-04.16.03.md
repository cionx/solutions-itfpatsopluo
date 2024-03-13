# Exercise 4.16.3 (Boundedness)

> Declare a function
> ```text
> bound : ∀ α β. map α β → α → B
> ```
> that checks whether a map binds a given key.
> Note that you can define `bound` using `lookup`.

---

We can explicitly declare `bound` as follows:
```text
             bound : ∀ α β. map α β → α → B
             bound [] a := false
bound ((a', b') :: m) a := a = a' || bound m a
```

In OCaml code:
```ocaml
let rec bound m a =
  match m with
  | [] -> false
  | (a', _) :: m -> a = a' || bound m a
```

We can also implement `bound` in terms of `lookup` using pattern matching:
```ocaml
let bound m a =
  match lookup m a with
  | None -> false
  | Some _ -> true
```
