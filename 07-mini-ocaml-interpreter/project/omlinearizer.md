# Linearization grammars

## Types

We have the following linearization grammar for types:
```text
 ty  ::=  pty "->" ty  |  pty
pty  ::=  int  |  bool  |  "(" ty ")"
```

## Expressions

For expressions, we start with the linearization grammar from Exercise 6.6.3:
```text
 exp  ::=  "if" exp "then" exp "else" exp
        |  "fun" var "->" exp
        |  "let" var "=" exp "in" exp
        |  "let rec" var var "=" exp "in" exp
        |  cexp
cexp  ::=  sexp "<=" sexp  |  sexp
sexp  ::=  sexp "+" mexp  |  sexp "-" mexp  |  mexp
mexp  ::=  mexp "*" aexp  |  aexp
aexp  ::=  aexp pexp  |  pexp
pexp  ::=  var  |  con  |  "(" exp ")"
```
We extend this grammar with typed lambda expressions and typed let-rec expressions:
```text
exp  ::=  ...
       |  "fun" var "->" exp
       |  "fun" "(" var ":" ty ")" "->" exp
       |  ...
       |  "let rec" var var "=" exp "in" exp
       |  "let rec" var "(" var ":" ty ")" ":" ty "=" exp "in" exp
       |  ...
```

## Values and value environments

For values, we use the following linearization grammar:
```text
val  ::=  int
       |  bool
       |  "(" var "," exp "," env ")"
       |  "(" var "," var "," exp "," env ")"
```

For environments, we will use OCaml linearization.
