# Exercise 4.9.4

> Translate the expression
> ```ocaml
> fun l -> match l with
>   | 0::x::_-> Some x
>   | x::1::_ -> Some x
>   | _ -> None
> ```
> into an expression only using simple matches.

---

We can re-declare the given function as follows:
```ocaml
fun l ->
  match l with
  | [] -> None
  | x :: l' -> begin
    match l' with
    | [] -> None
    | y :: l'' ->
      if x = 0 then Some y
      else if y = 1 then Some x
      else None
    end
```
