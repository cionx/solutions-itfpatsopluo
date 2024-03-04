let lexP p q (x1, x2) (y1, y2) =
  p x1 y1 && (if p y1 x1 then q x2 y2 else true)
