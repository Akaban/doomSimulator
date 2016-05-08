type t = {x : int; y : int}

let new_point x y = {x=x;y=y}

let toString p = "(x=" ^ string_of_int p.x ^ ",y=" ^ string_of_int p.y ^ ")"

let translateVect (dx,dy) alpha = new_point (truncate (dx *. Trigo.dcos alpha -. dy *. Trigo.dsin alpha)) 
                                               (truncate ( dx *. Trigo.dsin alpha +. dy *. Trigo.dcos alpha))
let translatePoint p vectPoint = new_point (p.x + vectPoint.x) (p.y + vectPoint.y)

let translatePointWithAngle p (dx,dy) alpha =
  let tVect = translateVect (dx,dy) alpha in
  translatePoint p tVect


