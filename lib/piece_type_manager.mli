(* Module PT = Chess_engine.Piece_type *)
type t
(** Type representing the piece type manager. *)

val create : unit -> t
(** Creates a new, empty piece type manager. *)

val add_piece_type : t -> string -> Piece_type.t -> unit
(** [add_piece_type manager name piece_type] adds a piece type to the manager.
    Raises [Invalid_argument] if a piece type with the same name already exists. *)

val get_piece_type : t -> string -> Piece_type.t option
(** [get_piece_type manager name] retrieves the piece type with the given [name].
    Returns [None] if no such piece type exists. *)

val all_piece_types : t -> (string * Piece_type.t) list
(** [all_piece_types manager] returns a list of all piece types registered in the manager,
    along with their names. *)

val remove_piece_type : t -> string -> unit
(** [remove_piece_type manager name] removes the piece type with the given [name].
    Does nothing if the piece type does not exist. *)
