(** General *)

type ('a, 'b) env = ('a * 'b) list

(** Lexing *)

type const = BCON of bool | ICON of int

type token =
  | LP
  | RP
  | EQ
  | COL
  | ARR
  | ADD
  | SUB
  | MUL
  | LEQ
  | IF
  | THEN
  | ELSE
  | LAM
  | LET
  | IN
  | REC
  | CON of const
  | VAR of string
  | BOOL
  | INT

(** Parsing *)

type ty = Bool | Int | Arrow of ty * ty

type con = Bcon of bool | Icon of int
type op = Add | Sub | Mul | Leq
type var = string

type exp =
  | Var of var
  | Con of con
  | Oapp of op * exp * exp
  | Fapp of exp * exp
  | If of exp * exp * exp
  | Lam of var * exp
  | Lamty of var * ty * exp
  | Let of var * exp * exp
  | Letrec of var * var * exp * exp
  | Letrecty of var * var * ty * ty * exp * exp

(** Evaluation *)

type value =
  | Bval of bool
  | Ival of int
  | Closure of var * exp * (var, value) env
  | Rclosure of var * var * exp * (var, value) env
