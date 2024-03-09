let empty _ =
  None

let lookup m a =
  m a

let update m a b a' =
  if a = a' then Some b else m a'
