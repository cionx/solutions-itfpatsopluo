# Exercise 10.5.5 (Quick sort with median-of-three pivots)

> Some implementations of quick sort choose the pivot as the median of the leftmost, middle, and rightmost element of the segment (the median of three numbers is the number that is in the middle after sorting).
> This can be realized by swapping the median into the rightmost position before the actual partition starts.
> 1. A segment in an array has the _median property_ if the rightmost element of the segment is the median of the leftmost, middle, and rightmost element of the segment.
>    Declare a function `ensure_median` that given an array and a nonempty segment establishes the median property by possibly swapping two elements.  
>    Hint:
>    The necessary case analysis as amazingly tricky.
>    Do a naive case analysis whether the leftmost or the rightmost or the middle element is the median using lazy boolean connectives.
> 2. Declare a quick sort function where partition establishes the median property before it partitions.

---

### 1.

We can declare the function `ensure_median` as follows in OCaml:
```ocaml
let ensure_median arr left right =
  let middle = (left + right) / 2 in
  let x = arr.(left) in
  let y = arr.(middle) in
  let z = arr.(right) in
  let median =
    if (y <= x && x <= z) || (z <= x && x <= y) then left
    else if (x <= y && y <= z) || (z <= y && y <= x) then middle
    else right
  in
  swap arr median right
```

### 2.

We only need to add a single line to the function `qsort'`:
```ocaml
let qsort a =
  let partition l r =
    let x = a.(r) in
    let rec loop i j =
      if j < i
      then (swap a i r; i)
      else if a.(i) < x then loop (i + 1) j
      else if a.(j) >= x then loop i (j - 1)
      else (swap a i j; loop (i + 1) (j - 1))
    in loop l (r - 1)
  in
  let rec qsort' l r =
    if l >= r then ()
    else begin
      ensure_median a l r;                (* new line *)
      let m = partition l r in
      qsort' l (m - 1); qsort' (m + 1) r
      end
  in qsort' 0 (Array.length a - 1)
```
