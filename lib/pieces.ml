module Pieces = struct
  open Core
  type move_vector = {
    can_capture: bool;
    max_iterations: int;
    vectors: (int * int) list;
  }
  
  type capture_vector = {
    max_iterations: int;
    vectors: (int * int) list;
  }

  type piece_type = {
    name: string;
    move_vectors: move_vector list;
    capture_vectors: capture_vector list;
  }

  type piece = {
    piece_type: piece_type;
    color: Core.piece_color;
  }

end
