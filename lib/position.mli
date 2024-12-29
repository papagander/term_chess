type pos = private { file : int; rank : int }
(** A validated position **)
type position = private Invalid | Some of pos
(** Either contains a valid position or indicates an invalid position **)
val try_create : int -> int -> position
(** Takes coords, returns an unvalidated position **)
val create : int -> int -> pos
(** Takes coords, returns a validated position if valid, raise exception if invalid **)
val is_invalid : position -> bool
(** Return false if position is valid, true if invalid **)
val validate : position -> pos
(** Return a validated position if valid, raise exception if invalid **)
val shift : position -> (int * int) -> position
(** Attempt to shift a position by a 2D offset. Returns an unvalidated position. **)
val file_letter : int -> char
(** Get letter symbol for a file number. Returns '_' if number is invalid **)
val name : pos -> string
(** Get standard chess name for a position. **)
