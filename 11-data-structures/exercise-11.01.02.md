# Exercise 11.1.2

> Arrays can be implemented with cells and lists.
> Declare a signature with a type family `array(α)` and the operations `make`, `get`, `set`, and `length`, and implement the signature with a structure not using arrays.
> We remark that expressing arrays with cells and lists comes at the expense that `get` and `set` cannot be realized as constant-time operations.

---

We use the following module signature:
```ocaml
module type ARRAY = sig
  type 'a t
  val make : int -> 'a -> 'a t
  val get : 'a t -> int -> 'a
  val set : 'a t -> int -> 'a -> unit
  val length : 'a t -> int
end
```
We implement this signature as follows:
```ocaml
module Array : ARRAY = struct
  type 'a t = 'a ref list * int

  let make n x : 'a t =
    let rec loop k acc =
      if k <= 0 then acc else loop (k - 1) (ref x :: acc)
    in
    (loop n [], n)

  let get ((l, _) : 'a t) n =
    let rec loop k l = match l with
      | [] -> invalid_arg "get: index out of bounds"
      | c :: l ->
        if k = 0 then !c else loop (k - 1) l
    in
    if n < 0 then invalid_arg "get: negative index"
    else loop n l

  let set ((l, _) : 'a t) n x =
    let rec loop k l = match l with
      | [] -> invalid_arg "set: index out of bounds"
      | c :: l ->
        if k = 0 then c := x else loop (k - 1) l
    in
    if n < 0 then invalid_arg "set: negative index"
    else loop n l

  let length ((_, n) : 'a t) =
    n
end
```
Our implementation ensures that `Array.length` still takes only constant time.
