(** Represents the attributes and movement rules for a chess piece type. *)

(** Directions and rules for movement. *)
type move_vector_group = private {
  vectors: (int * int) list; (** Directions the piece can move in. *)
  max_iterations: int;       (** Maximum number of steps in each direction. *)
  can_capture: bool;         (** Whether the piece can capture along these vectors. *)
}

(** Directions and rules for capturing. *)
type capture_vector_group = private {
  vectors: (int * int) list; (** Directions the piece can capture in. *)
  max_iterations: int;       (** Maximum number of steps in each direction. *)
}

(** Abstract type for a piece type. *)
type t

val create :
  name:string ->
  move_vectors:move_vector_group list ->
  capture_vectors:capture_vector_group list ->
  t
(** [create ~name ~move_vectors ~capture_vectors] creates a new piece type. *)

val name : t -> string
(** [name piece_type] retrieves the name of the piece type. *)

val move_vectors : t -> move_vector_group list
(** [move_vectors piece_type] retrieves the movement rules for the piece type. *)

val capture_vectors : t -> capture_vector_group list
(** [capture_vectors piece_type] retrieves the capture rules for the piece type. *)

val create_move_vector_group :
  vectors:(int * int) list ->
  max_iterations:int ->
  can_capture:bool ->
  move_vector_group
(** [create_move_vector_group ~vectors ~max_iterations ~can_capture] creates a move vector group. *)

val create_capture_vector_group :
  vectors:(int * int) list ->
  max_iterations:int ->
  capture_vector_group
(** [create_capture_vector_group ~vectors ~max_iterations] creates a capture vector group. *)
