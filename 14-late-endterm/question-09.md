# Array rotation 12P

> Declare a function `rotate : ∀ α. array(α) → unit` rotating the elements of an array by shifting each element by one position to the right except for the last element, which becomes the new first element.
> For instance, rotation changes the state `[1, 2, 3]` of an array to `[3, 1, 2]`.
> Use only tail recursion.

---

We can declare the function `rotate` as follows:
```ocaml
let rotate arr =
  let n = Array.length arr in
  let rec loop i =
    if i <= 0 then ()
    else begin
      arr.(i) <- arr.(i - 1);
      loop (i - 1)
      end
  in
  if n = 0 then ()
  else
    let last = arr.(n - 1) in
    loop (n - 1);
    arr.(0) <- last;
    ()
```
