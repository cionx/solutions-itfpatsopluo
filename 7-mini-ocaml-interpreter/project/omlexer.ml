open Omtypes

let whitespace c =
  c = ' ' || c = '\t' || c = '\n'

let digit c =
  '0' <= c && c <= '9'

let lc_letter c =
  'a' <= c && c <= 'z'

let up_letter c =
  'A' <= c && c <= 'Z'

let id_char c =
  lc_letter c || up_letter c || c = '_' || c = '\''

let num c =
  Char.code c - Char.code '0'

let lex s: token list =
  let get = String.get s in
  let getstr i n = String.sub s (i - n) n in
  let exhausted i = i >= String.length s in
  let verify i c = not (exhausted i) && get i = c in
  let rec lex' i l =
    if exhausted i then List.rev l
    else match get i with
      (* a) skip whitepace *)
      | c when whitespace c -> lex' (i + 1) l
      (* b) direct characters *)
      | '(' -> lex' (i + 1) (LP :: l)
      | ')' -> lex' (i + 1) (RP :: l)
      | '+' -> lex' (i + 1) (ADD :: l)
      | '*' -> lex' (i + 1) (MUL :: l)
      | '=' -> lex' (i + 1) (EQ :: l)
      | ':' -> lex' (i + 1) (COL :: l)
      (* c) Leq token *)
      | '<' ->
        if verify (i + 1) '='
        then lex' (i + 2) (LEQ :: l)
        else failwith "lex: illegal character after '<'"
      (* d) minus sign *)
      | '-' ->
        if verify (i + 1) '>'
        then lex' (i + 2) (ARR :: l)
        else lex' (i + 1) (SUB :: l)
      (* e) numbers *)
      | c when digit c -> lex_num (i + 1) (num c) l
      (* f) identifiers and keywords *)
      | c when lc_letter c -> lex_id (i + 1) 1 l
      | _ -> failwith "lex: illegal character"
  and lex_num i n l =
    if exhausted i || not (digit (get i))
    then lex_num' i n l
    else lex_num (i + 1) (10 * n + num (get i)) l
  and lex_num' i n l = lex' i (CON (ICON n) :: l)
  and lex_id i n l =
    if exhausted i || not (id_char (get i))
    then lex_id' i n l
    else lex_id (i + 1) (n + 1) l
  and lex_id' i n l =
    let token = match getstr i n with
      (* keywords *)
      | "if" -> IF
      | "then" -> THEN
      | "else" -> ELSE
      | "fun" -> LAM
      | "let" -> LET
      | "in" -> IN
      | "rec" -> REC
      | "true" -> CON (BCON true)
      | "false" -> CON (BCON false)
      | "int" -> INT
      | "bool" -> BOOL
      (* identifiers *)
      | s -> VAR s
    in
    lex' i (token :: l)
  in
  lex' 0 []
