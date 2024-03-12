(** From the textbook. *)

module type BSTACK = sig
  val empty : unit -> bool
  val full : unit -> bool
  val push : int -> unit
  val pop : unit -> unit
  val top : unit -> int
end

module S : BSTACK = struct
  let size = 100
  let a = Array.make size 0
  let h = ref 0 (* height of stack *)
  exception Empty
  exception Full
  let empty () = !h = 0
  let full () = !h = size
  let push x = if full () then raise Full else a.(!h) <- x; h := !h + 1
  let pop () = if empty () then raise Empty else h := !h - 1
  let top () = if empty () then raise Empty else a.(!h - 1)
end



(** For this exercise. *)

(** PARTS 1 AND 2 *)

(** [pushList l] pushes the list [l] onto the stack, with the head first. *)
let rec pushList l = match l with
  | [] -> ()
  | x :: l -> S.push x; pushList l

(** [readList ()] pops and reads the entire stack into a list; the top of the
    stack is the last entry in the list. *)
let rec readList () =
  let rec loop acc = 
    if S.empty () then acc
    else let x = S.top () in S.pop (); loop (x :: acc)
  in
  loop []

(** [toList ()] as the current state of the stack as a list, with the top of the
    stack as the head of the list. *)
let toList () =
  let l = readList () in
  pushList l;
  List.rev l

(** [ofList l] sets the state of the stack to [l], with the head of [l] as the
    top of the stack. *)
let ofList l =
  let _ = readList () in
  pushList (List.rev l)
