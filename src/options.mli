type tmode = TwoD | ThreeD

type runningData =
  { labInitPos : Point.t ;
    labInitAngle : int;
    mutable playerInfo : bool;
    mazeEndpos : Point.t
  }

val mode : tmode

val cin : in_channel option 

val win_w : int
val win_h : int

val maze : bool
val maze_size : int
val maze_width : int

val ceiling_h : int
val floor_h : int
val wall_h : int
val eye_h : int ref
val eye_h_accroupi : int
val eye_h_debout : int

val fov : int

val defaultCeilingh : int
val ceilingh : int ref
val ceilingMultiplicatorRange : int
val ceilingMultiplicator : float
val ceilingMultiplicator2 : float

val rainbow : bool
val minimap_color : Graphics.color
val bg : Graphics.color
val ceiling_color : Graphics.color
val fill_color : Graphics.color
val contour_color : Graphics.color
val draw_contour : bool ref
val fill_wall : bool ref

val mouse_sensitivity : int
val angular_change : int

val max_dist : float


val step_dist : float ref
val step_dist_debout : float
val step_dist_accroupi : float
val step_dist_rush : float

val gravity : float
val jumpSpeed : float
val jumpPeak : int

val size2d : int

val wall_collision_size : float ref

val angleMiniMap : int
val sizeAngleMiniMap : float

val xmin : float
val xmax : float

val scale : int
val minimap : bool
val minimap_xmax : int 

val debug_manualRender : bool ref

val debug : bool ref
val debug_bsp : bool

val collision : bool ref
