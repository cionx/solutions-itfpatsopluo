# Exercise 7.4.1

> Rewrite the function `lex` so that no patterns with `when` conditions are used.
> Use nested conditionals instead.

---

We can re-write the code
```ocaml
| c when whitespace c -> lex (i+1) l
| c when digit c -> lex_num (i+1) (num c) l
| c when lc_letter c -> lex_id (i+1) 1 l
| c -> failwith "lex: illegal character"
```
as follows:
```ocaml
| c ->
  if whitespace c then lex (i + 1) l
  else if digit c then lex_num (i + 1) (num c) l
  else if lc_letter c -> lex_id (i + 1) 1 l
  else failwith "lex: illegal character"
```

