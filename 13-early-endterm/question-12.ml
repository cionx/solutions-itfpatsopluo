(** From the textbook, with slight modifications for this exercise. *)

type tree = A | B of tree * tree

module type HEAP = sig
  type address = int
  type index = int
  val alloc : int -> address
  val get : address -> index -> int
  val set : address -> index -> int -> unit
  val release : address -> unit
end

module H : HEAP = struct
  let maxSize = 1000
  let h = Array.make maxSize (-1)
  let s = ref 0 (* current size of heap *)
  exception Address
  exception Full
  type address = int
  type index = int
  let alloc n =
    if n < 1 then raise Address
    else if !s + n > maxSize then raise Full
    else let a = !s in s := !s + n; a
  let check a = if a < 0 || a >= !s then raise Address else a
  let get a i = h.(check (a + i))
  let set a i x = h.(check (a + i)) <- x
  let release a = s := check a
end

let alloc l =
  let a = H.alloc (List. length l) in
  let rec loop l i =
    match l with
    | [] -> a
    | x :: l -> H.set a i x; loop l (i + 1)
  in loop l 0

let get = H.get



(** For this exercise. *)

let rec putMaxTree n =
  if n <= 0 then -1
  else let a = putMaxTree (n - 1) in alloc [a; a]

let rec getTree a =
  if a = -1 then A
  else
    let a1 = get a 0 in
    let a2 = get a 1 in
    if a1 = a2
    then let t = getTree a1 in B (t, t)
    else B (getTree a1, getTree a2)
