You can compile the project with `ocamlc` via the provided Makefile:
```sh
make
```
The generated executable is named `interpreter`.
After starting it, you will be greeted by an input prompt:
```text
>
```
Here are some examples of its usage:
```text
> help
Usage: "type <expr>" or "eval <expr>"
> type 3 + 5
int
> eval 3 + 5
8
> type fun (x : int) -> 2 * x
int -> int
> eval fun x -> 2 * x
(x, 2 * x, [])
> eval (fun x -> 2 * x) 3
6
> eval let rec fac (n : int) : int = if n <= 0 then 1 else n * fac (n - 1) in fac 5
120
```

Tip: you can use `rlwrap` to add back-scrolling and an input history.
