# Exercise 6.1.3 (Explode and implode)

> The functions
> ```ocaml
>   let explode s = List.init (String.length s) (String.get s)
>   let implode l = List.fold_right (fun c s -> String.make 1 c ^ s) l ""
> ```
> convert between strings and character lists such that the equations
> $$
>   \begin{aligned}
>     \mathit{implode} \; (\mathit{explode} \; s) &= s \\
>     \mathit{explode} \; (\mathit{implode} \; l) &= l
>   \end{aligned}
> $$
> hold for all strings $s$ and all character lists $l$.
> Note the use of OCaml’s function $\mathit{String.make}$ providing for the translation of characters into strings ($\mathit{String.make} \enspace n \enspace c$ yields the string consisting of $n \geq 0$ occurrences of the character $c$).
> 1. Try explode `"Saarbrücken"` and try to explain what you see.
> 2. Try implode `['\240'; '\159'; '\152'; '\138']` and enjoy.
> 3. Try implode `['\240'; '\159'; '\167'; '\144']` and enjoy.
> 4. Convince yourself that OCaml’s order on characters yields true for the following comparisons:
>    `'A' < 'B'`, `'Z' < 'a'`, and `'a' < 'b'`.
>    Look up “ASCII” in the web to know more.
> 5. Convince yourself that OCaml’s order on strings is the lexical order on character lists obtained with OCaml’s order on characters.

---

#### 1.

We get the following output:
```ocaml
# explode "Saarbrücken";;
- : char list =
['S'; 'a'; 'a'; 'r'; 'b'; 'r'; '\195'; '\188'; 'c'; 'k'; 'e'; 'n']
```
The umlaut “ü” is not part of the ASCII character set.
Instead of the single-byte representation of ASCII characters, it uses two bytes.
Namely, the ones corresponding to the numbers 195 and 188.

### 2. and 3.

We get Emoji characters:
```ocaml
# implode ['\240'; '\159'; '\152'; '\138'];;
- : string = "😊"

# implode ['\240'; '\159'; '\167'; '\144'];;
- : string = "🧐"
```

### 4.

I have convinced myself.

### 5.

I have convinced myself.
