(** From the textbook. *)

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

let alloc' l =
  let a = H.alloc (List. length l) in
  let rec loop l i =
    match l with
    | [] -> a
    | x :: l -> H.set a i x; loop l (i + 1)
  in loop l 0



(** For this exercise. *)

(** [getclist n a] are the first [n] entries of a circular list saved at [a]. *)
let rec getclist n a =
  if n <= 0 then []
  else H.get a 0 :: getclist (n - 1) (H.get a 1)

let a' = alloc' [2; -1]
let a = alloc' [1; a']
let _ = H.set a' 1 a
