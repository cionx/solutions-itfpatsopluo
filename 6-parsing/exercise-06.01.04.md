# Exercise 6.1.4 (ASCII Codes)

> OCaml has two functions
> $$
> \begin{gathered}
>   \mathit{Char.code} : \mathit{char} → \mathit{int} \\
>   \mathit{Char.chr} : \mathit{int} → \mathit{char}
> \end{gathered}
> $$
> converting between characters and ASCII codes, which are numbers between 0 and 255.
> We have $\mathit{Char.chr} \; (\mathit{Char.code} \; c) = c$ for all characters $c$.
> Moreover, $c < c'$ if and only if $\mathit{Char.code} \; c < \mathit{Char.code} \; c'$. Look up an ASCII table in the web to learn more.
> Using conversion to ASCII codes, declare functions as follows:
> 1. A function checking whether a character is a digit.
> 2. A function converting characters that are digits into numbers.
> 3. A function checking whether a character is a lower case letter between `'a'` and `'z'`.
> 4. A function checking whether a character is an upper case letter between `'A'` and `'Z'`.

---

### 1.

The character range `'0'`, …, `'9'` corresponds to the ASCII codes 48, …, 57.
We can therefore declare the described function as follows:
```ocaml
let isdigit c =
  let a = Char.code c in
  48 <= a && a <= 57
```

### 2.

We can declare the described function as follows:
```ocaml
let int_of_digit c =
  Char.code c - 48
```

### 3.

The character range `'a'`, …, `'z'` corresponds to the ASCII codes 97, …, 122.
We can therefore declare the desired function as follows:
```ocaml
let islowercase c =
  let a = Char.code c in
  97 <= a && a <= 122
```

### 4.

The character range `'A'`, …, `'Z'` corresponds to the ASCII codes 65, …, 90.
We can therefore declare the desired function as follows:
```ocaml
let isuppercase c =
  let a = Char.code c in
  65 <= a && a <= 90
```
