(** From the textbook. *)

module type BQUEUE = sig
  val empty : unit -> bool
  val full : unit -> bool
  val insert : int -> unit
  val remove : unit -> unit
  val first : unit -> int
end

module Q : BQUEUE = struct
  let size = 100
  let a = Array.make size 0
  let s = ref 0 (* position of the first entry *)
  let l = ref 0 (* number of entries *)
  exception Empty
  exception Full
  let empty () = !l = 0
  let full () = !l = size
  let pos x = x mod size
  let insert x =
    if full () then raise Full
    else a.(pos(!s + !l)) <- x; l := !l + 1
  let remove () =
    if empty () then raise Empty
    else s := pos (!s + 1); l := !l - 1
  let first () =
    if empty () then raise Empty else a.(!s)
end



(** For this exercise. *)

(** PARTS 1 AND 2. *)

(** [readList] reads/removes all entries of the queue into a list. The most
    recent entries appear first. *)
let readList () =
  let rec loop acc =
    if Q.empty () then acc
    else
      let x = Q.first () in
      Q.remove ();
      loop (x :: acc)
  in
  loop []

(** [insertList l] inserts all entries of the list [l] into the queue. The
    first entry of [l] is inserted first. *)
let rec insertList l = match l with
  | [] -> ()
  | x :: l -> Q.insert x; insertList l

(** [toList ()] is a list containing the entries of the queue. The first entry
    of the queue appears first in the list. *)
let toList () =
  let l = readList () in
  insertList (List.rev l);
  l

(** [ofList l] sets the state of the queue to the list [l]. The first entry of
    [l] is becomes the latest entry of the queue. *)
let ofList l =
  let _ = readList () in
  insertList (List.rev l)
