# Array reversal 10P

> Declare a function `rev : ∀ α. array(α) → unit` reversing arrays.
> For instance, an array with state `[1, 2, 3]` should be updated to the state `[3, 2, 1]`.

---

We can declare the function `rev` as follows:
```ocaml
let swap arr i j =
  let tmp = arr.(i) in arr.(i) <- arr.(j); arr.(j) <- tmp

let rev arr =
  let rec loop i j =
    if i > j then ()
    else begin
      swap arr i j;
      loop (i + 1) (j - 1)
      end
  in
  loop 0 (Array.length arr - 1)
```
