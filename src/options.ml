type tmode = TwoD | ThreeD 

let usage = "usage: ./bsp file.lab"
let file = ref ""

let mode = ref TwoD

let size2d = ref 4

let win_w = ref 800
let win_h = ref 800

let mouse_sensitivity = ref 1
let angularChange = ref 1

let max_dist = ref 3000

let fov = ref 60

let step_dist = ref 10

let xmin = ref 1
let xmax = 9000.

let scale = ref 5
let minimap = ref false

let debug = ref false
let debug_bsp = ref false

let set_mode = function
  | "2D" -> mode := TwoD
  | "3D" -> mode := ThreeD
  | _ -> raise (Arg.Bad "2D or 3D only")


let specs = 
  [ "-mode", Arg.String set_mode, "<2D | 3D> 2D or 3D display";
    "-fov", Arg.Set_int fov, " field of vision (angle de vision)";
    "-dims", Arg.Tuple [Arg.Set_int win_w; Arg.Set_int win_h], 
    " set the dimensions of the graph";
    "-scale", Arg.Set_int scale, " scale of the 2D map";
    "-map", Arg.Set minimap, " set a minimap in the lower left corner";
    "-step", Arg.Set_int step_dist, " set the distance between two steps";
    "-xmin", Arg.Set_int xmin, " set minimum distance of display";
    "-debug", Arg.Set debug, " debugging 2D rendering";
    "-debugbsp", Arg.Set debug_bsp, " debugging bsp";
  ]

let alspecs = Arg.align specs

let cin =
  let ofile = ref None in
  let set_file s =
    if Filename.check_suffix s ".lab" then ofile := Some s
    else raise (Arg.Bad "no .lab extension");
  in
  Arg.parse alspecs set_file usage;
  match !ofile with 
    | Some f -> file := f ; open_in f
    | None -> raise (Arg.Bad "no file provided")


let file = !file

let win_w = !win_w
let win_h = !win_h

let mouse_sensitivity = !mouse_sensitivity
let angular_change = !angularChange

let max_dist = float !max_dist

let xmin = float !xmin

let ceiling_h = win_h / 3
let floor_h = 0
let wall_h = ceiling_h - floor_h
let eye_h_debout = wall_h - wall_h/3
let eye_h_accroupi = eye_h_debout / 2
let eye_h = ref eye_h_debout

let mode = !mode

let size2d = !size2d

let wall_collision_size = float !step_dist *. 1.5

let angleMiniMap = 23
let sizeAngleMiniMap = float !step_dist

let fov = !fov

(* draw options *)
let bg = Colors.grey
let fill_color = Graphics.blue
let contour_color = Graphics.white
let draw_contour = ref false
let fill_wall = ref true

let collision = ref true

(*si notre joueur est accroupi alors il est logique qu'il
 * avance moins vite donc un step_dist moindre *)
let step_dist_debout = float !step_dist
let step_dist_accroupi = step_dist_debout /. 2.
let step_dist = ref step_dist_debout

let scale = !scale
let minimap = !minimap

let debug_manualRender = ref false

let debug = ref false
let debug_bsp = !debug_bsp


