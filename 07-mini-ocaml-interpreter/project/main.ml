open Omtypes
open Omenvs
open Omlexer
open Omparser
open Omlinearizer
open Omtypechecker
open Omevaluator

(** Background functions. *)

let parse s =
  fst (exp (lex s))

let checkStr s =
  check [] (parse s)

let evalStr s =
  eval [] (parse s)

(** Main loop. *)

(** [split s l] is [(s1, s2)] such that [s = s1 ^ s2] and [s1] is of lenght [l]. *)
let split s l =
  let n = String.length s in
  let s1 = String.sub s 0 l in
  let s2 = String.sub s l (n - l) in
  (s1, s2)

let rec main () =
  let help = "Usage: \"type <expr>\" or \"eval <expr>\"" in
  let loop () =
    let input = read_line () in
    let output =
      if String.length input >= 5 then
        match split input 5 with
        | "type ", s -> lin_ty (checkStr s)
        | "eval ", s -> lin_value (evalStr s)
        | _ -> help
      else help
    in print_endline output; main ()
  in loop ()

let _ = main ()
