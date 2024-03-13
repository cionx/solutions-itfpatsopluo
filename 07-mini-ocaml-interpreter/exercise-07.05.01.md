# Exercise 7.5.1

> Give the parsing grammar for Mini-OCaml expressions.

---

We have the following parsing grammar for Mini-OCaml types (as taken from the textbook):
```text
 ty   ::=  pty ty'
 ty'  ::=  "->" ty  |  []
pty   ::=  "bool"  |  "int  |  "(" ty ")"
```

We only need to extend the grammar from Exercise 6.6.3 to support type annotations:
```text
 exp  ::=  "if" exp "then" exp "else" exp
        |  "fun" var "->" exp
        |  "fun" "(" var ":" ty ")" "->" exp
        |  "let" var "=" exp "in" exp
        |  "let rec" var var "=" exp "in" exp
        |  "let rec" var "(" var ":" ty ")" ":" ty "=" exp "in" exp
        |  cexp
cexp  ::=  sexp cexp'
cexp' ::=  "<=" sexp  |  []
sexp  ::=  mexp sexp'
sexp' ::=  "+" mexp sexp'  |  "-" mexp sexp'  |  []
mexp  ::=  aexp mexp'
mexp' ::=  "*" aexp mexp'  |  []
aexp  ::=  pexp aexp'
aexp' ::=  pexp aexp'  |  []
pexp  ::=  var  |  con  |  "(" exp ")"
```
