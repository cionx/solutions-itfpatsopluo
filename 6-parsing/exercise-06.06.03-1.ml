type var = string
type con = Bcon of bool | Icon of int
(** Tokens. *)
type token =
  | TkAdd | TkSub | TkMul | TkLP | TkRP | TkEq | TkLeq | TkArr
  | TkVar of string | TkCon of con
  | TkIf | TkThen | TkElse | TkLam | TkLet | TkIn | TkRec
(** Expressions. *)
type op = EAdd | ESub | EMul | ELeq
type exp =
  | EVar of var
  | ECon of con
  | EOapp of op * exp * exp
  | EFapp of exp * exp
  | EIf of exp * exp * exp
  | ELam of var * exp
  | ELet of var * exp * exp
  | ELetrec of var * var * exp * exp





(** LEXER *)

(** [howmany p s start] is how many characters in [s] satisfy [p], starting at
    index [start]. *)
let howmany p s start =
  let n = String.length s in
  let rec helper i =
    if i < n && p (String.get s i) then helper (i + 1) else i
  in
  (helper start) - start

(** [digit c] is whether [c] is a character in range ['0', ..., '9']. *)
let digit c =
  '0' <= c && c <= '9'

(** [lowercase c] is whether [c] is a character in range ['a', ..., 'z']. *)
let lowercase c =
  'a' <= c && c <= 'z'

(** [uppercase c] is whether [c] is a character in range ['A', ..., 'Z']. *)
let uppercase c =
  'A' <= c && c <= 'Z'

(** [identifier_char c] is whether [c] is a valid identifier character: a digit,
    a lowercase latter, an uppercase letter, or an underscore. *)
let identifier_char c =
  digit c || lowercase c || uppercase c || c = '_'

(** [int_of_digit c] is the numerical value of a character ['0', ..., '9']. *)
let int_of_digit c =
  Char.code c - Char.code '0'

let int_of_string s =
  let n = String.length s in
  let rec helper i acc =
    if i >= n then acc
    else
      let c = String.get s i in
      helper (i + 1) (10 * acc + int_of_digit c)
  in
  helper 0 0

let lex s =
  let n = String.length s in
  let rec lex' i l =
    if i >= n then List.rev l
    else match String.get s i with
      (* a) skip whitespace *)
      | ' ' | '\t' | '\n' -> lex' (i + 1) l
      (* b) simple characters *)
      | '+' -> lex' (i + 1) (TkAdd :: l)
      | '*' -> lex' (i + 1) (TkMul :: l)
      | '=' -> lex' (i + 1) (TkEq :: l)
      | '(' -> lex' (i + 1) (TkLP :: l)
      | ')' -> lex' (i + 1) (TkRP :: l)
      (* c) character '<' *)
      | '<' ->
        if i < n - 1 && String.get s (i + 1) == '='
        then lex' (i + 2) (TkLeq :: l)
        else failwith "lex: illegal character after '<'"
      (* d) character '-' *)
      | '-' ->
        if i < n - 1 && String.get s (i + 1) == '>'
        then lex' (i + 2) (TkArr :: l)
        else lex' (i + 1) (TkSub :: l)
      (* e) digits *)
      | '0'..'9' ->
        let len = howmany digit s i in
        let num = int_of_string (String.sub s i len) in
        lex' (i + len) ((TkCon (Icon num)) :: l)
      (* f) identifiers *)
      | 'a'..'z' ->
        let len = howmany identifier_char s i in
        let id = String.sub s i len in
        let tk = begin match id with
          (* f.i. structure keywords *)
          | "if" -> TkIf
          | "then" -> TkThen
          | "else" -> TkElse
          | "fun" -> TkLam
          | "let" -> TkLet
          | "in" -> TkIn
          | "rec" -> TkRec
          (* f.ii. boolean constants *)
          | "true" -> TkCon (Bcon true)
          | "false" -> TkCon (Bcon false)
          (* f.iii. variable names *)
          | id -> TkVar id
          end
        in lex' (i + len) (tk :: l)
      | _ -> failwith "lex: illegal character"
  in
  lex' 0 []





(** PARSER *)

let verify c l =
  match l with
  | [] -> failwith "verify: no token"
  | c' :: l -> if c = c' then l else failwith "verify: wrong token"

let rec exp l = match l with
  | TkIf :: l ->
    let (e1, l) = exp l in
    let l = verify TkThen l in
    let (e2, l) = exp l in
    let l = verify TkElse l in
    let (e3, l) = exp l in
    (EIf (e1, e2, e3), l)
  | TkLam :: (TkVar x) :: TkArr:: l ->
    let (t, l) = exp l in
    (ELam (x, t), l)
  | TkLet :: (TkVar x) :: TkEq :: l ->
    let (e1, l) = exp l in
    let l = verify TkIn l in
    let (e2, l) = exp l in
    (ELet (x, e1, e2), l)
  | TkLet :: TkRec :: (TkVar f) :: (TkVar x) :: TkEq :: l ->
    let (e1, l) = exp l in
    let l = verify TkIn l in
    let (e2, l) = exp l in
    (ELetrec (f, x, e1, e2), l)
  | l -> cexp l
and cexp l =
  let (e, l) = sexp l in cexp' e l
and cexp' e l = match l with
  | TkLeq :: l ->
    let (e', l) = sexp l in (EOapp (ELeq, e, e'), l)
  | _ -> (e, l)
and sexp l =
  let (e, l) = mexp l in sexp' e l
and sexp' e l = match l with
  | TkAdd :: l ->
    let (e', l) = mexp l in sexp' (EOapp (EAdd, e, e')) l
  | TkSub :: l ->
    let (e', l) = mexp l in sexp' (EOapp (ESub, e, e')) l
  | _ -> (e, l)
and mexp l =
  let (e, l) = aexp l in mexp' e l
and mexp' e l = match l with
  | TkMul :: l ->
    let (e', l) = aexp l in mexp' (EOapp (EMul, e, e')) l
  | _ -> (e, l)
and aexp l =
  let (e, l) = pexp l in aexp' e l
and aexp' e l = match l with
  | (TkVar _) :: _ | (TkCon _) :: _ | TkLP :: _ ->
    let (e', l) = pexp l in aexp' (EFapp (e, e')) l
  | _ -> (e, l)
and pexp l = match l with
  | (TkVar x) :: l -> (EVar x,  l)
  | (TkCon c) :: l -> (ECon c, l)
  | TkLP :: l ->
    let (e, l) = exp l in
    let l = verify TkRP l in
    (e, l)
  | _ -> failwith "parse"





(** LINEARIZER *)

let string_of_bool b =
  match b with
  | true -> "true"
  | false -> "false"

let digit_of_int i =
  Char.chr (i + Char.code '0')

let string_of_int i =
  let rec helper i acc =
    if i = 0 then acc
    else
      helper (i / 10) (String.make 1 (digit_of_int (i mod 10)) ^ acc)
  in
  if i = 0 then "0"
  else if i < 0 then "-" ^ (string_of_int (-i))
  else helper i ""

let rec lin_exp e = match e with
  | EIf (e1, e2, e3) ->
    "if " ^ lin_exp e1 ^ " then " ^ lin_exp e2 ^ " else " ^ lin_exp e3
  | ELam (x, e) ->
    "fun " ^ x ^ " -> " ^ lin_exp e
  | ELet (x, e1, e2) ->
    "let " ^ x ^ " = " ^ lin_exp e1 ^ " in " ^ lin_exp e2
  | ELetrec (f, x, e1, e2) ->
    "let rec " ^ f ^ " " ^ x ^ " = " ^ lin_exp e1 ^ " in " ^ lin_exp e2
  | e -> lin_cexp e
and lin_cexp e = match e with
  | EOapp (ELeq, e1, e2) ->
    lin_sexp e1 ^ " <= " ^ lin_sexp e2
  | e -> lin_sexp e
and lin_sexp e = match e with
  | EOapp (EAdd, e1, e2) ->
    lin_sexp e1 ^ " + " ^ lin_mexp e2
  | EOapp (ESub, e1, e2) ->
    lin_sexp e1 ^ " - " ^ lin_mexp e2
  | e -> lin_mexp e
and lin_mexp e = match e with
  | EOapp (EMul, e1, e2) ->
    lin_mexp e1 ^ " * " ^ lin_aexp e2
  | e -> lin_aexp e
and lin_aexp e = match e with
  | EFapp (e1, e2) ->
    lin_aexp e1 ^ " " ^ lin_pexp e2
  | e -> lin_pexp e
and lin_pexp e = match e with
  | EVar x -> x
  | ECon (Bcon b) -> string_of_bool b
  | ECon (Icon i) -> string_of_int i
  | e -> "(" ^ lin_exp e ^ ")"





(** FOR TESTING *)

let test s =
  lin_exp (fst (exp (lex s)))
