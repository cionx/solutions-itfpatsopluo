# Exercise 2.1.1

> Mark the words in the following character sequences.
> For each word give the lexical class.  
> a) `if x <= 1 then true else f (x+1)`  
> b) `let rec f x : int = (*TODO*) +x`  
> c) `let city = "Saarbrücken"in`  
> d) `int * int -> bool`  
> e) `if rec then <3`  
> Why does the character sequence `Saarbrücken` not represent a valid word?

---

### a)

```text
if x <= 1 then true else f (x+1)
__ _ __ _ ____ ____ ____ _ _____
a  b c  d e    f    g    h ijklm

a: keyword
b: identifier
c: operator
d: integer literal
e: keyword
f: boolean literal
g: keyword
h: identifier
i: keyword
j: identifier
k: operator
l: integer literal
m: keyword
```

### b)

```text
let rec f x : int = (*TODO*) +x
___ ___ _ _ _ ___ _          __
a   b   c d e f   g          hi

a: keyword
b: keyword
c: identifier
d: identifier
e: keyword
f: identifier
g: keyword
h: operator
i: identifier
```

### c)

```text
let city = "Saarbrücken"in
___ ____ _ _______________
a   b    c d            e

a: keyword
b: identifier
c: keyword
d: string literal
e: keyword
```

### d)

```text
int * int -> bool
___ _ ___ __ ____
a   b c   d  e

a: identifier
b: keyword
c: identifier
d: keyword
e: identifier
```

### e)

```text
if rec then <3
__ ___ ____ __
a  b   c    de

a: keyword
b: keyword
c: keyword
d: operator
e: integer literal
```

### Saarbrücken

The character sequence `Saarbrücken` is neither a keyword, operator, boolean literal, integer literal nor string literal.
It is also not an identifier since
1. it doesn’t start with a lowercase letter, and
2. it contains special characters (an umlaut).

It therefore fits into none of the word classes.
Hence, it is not a valid word.
