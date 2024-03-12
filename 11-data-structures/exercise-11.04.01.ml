module type Queue = sig
  type 'a queue
  exception Empty
  exception Full
  val make: int -> 'a -> 'a queue
  val empty : 'a queue -> bool
  val full : 'a queue -> bool
  val insert : 'a queue -> 'a -> unit
  val remove : 'a queue -> unit
  val first : 'a queue -> 'a
end

module Q : Queue = struct
  type 'a queue = 'a array * int ref * int ref

  exception Empty
  exception Full

  let make size x : 'a queue =
    (Array.make size x, ref 0, ref 1)

  let empty ((_, _, l) : 'a queue) =
    !l = 0

  let full ((a, _, l) : 'a queue) =
    !l = Array.length a

  let index a i =
    i mod (Array.length a)

  let insert ((a, s, l) : 'a queue) x =
    if full (a, s, l) then raise Full
    else
      a.(index a (!s + !l)) <- x;
    l := !l + 1

  let remove ((a, s, l) : 'a queue) =
    if empty (a, s, l) then raise Empty
    else s := (!s + 1); l := !l - 1

  let first ((a, s, l) : 'a queue) =
    if empty (a, s, l) then raise Empty
    else a.(!s)
end
