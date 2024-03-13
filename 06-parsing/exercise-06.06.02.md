# Exercise 6.6.2

> Declare a function `string → string` reading an identifier starting with a lower case letter from a string.
> Assume that the string starts with a lower case letter and read as many letters and digits
> as possible.
> For instance, `"dieter2Schlau+x"` should yield the identifier `"dieter2Schlau"`.
> Realize the function with a tail-recursive helper function and OCaml’s function `List.sub s i n` yielding the substring of `s` starting at position `i` and having length `n`.
> Make use of ASCII codes (see Exercise 6.1.4) to identify lower case letters, upper case letters, and digits.

---

We also allow underscores in identifier names.

We use the following functions to identify lower case letters, upper case letters, and digits:
```ocaml
let lowercase c =
  'a' <= c && c <= 'z'

let uppercase c =
  'A' <= c && c <= 'Z'

let digit c =
  '0' <= c && c <= '9'
```
The following function checks if a character is valid part of an identifier:
```ocaml
let valid c =
  lowercase c || uppercase c || digit c || c = '_'
```

The next function finds the first index whose character is not valid part of an identifier:
```ocaml
let first_nonvalid s =
  let n = String.length s in
  let rec helper i =
    if i >= n || not (valid (String.get s i)) then i else helper (i + 1)
  in
  helper 0
```

We can now declare the required function as follows:
```ocaml
let identifier s =
  let l = first_nonvalid s in
  String.sub s 0 l
```
