(** Implements the piece_type module. *)

type move_vector_group = {
  vectors: (int * int) list;
  max_iterations: int;
  can_capture: bool;
  can_move: bool;
  file_symmetric: bool;
  rank_symmetric: bool;
}

type expanded_move_vector_group = {
  vectors: (int * int) list;
  max_iterations: int;
  can_capture: bool;
  can_move: bool;
}

type t = {
  name: string;
  move_vectors: move_vector_group list;
}

type offset_group = {
  offsets: ( int * int ) list;
  can_capture: bool;
  can_move: bool;
}

let add_offset ( offset: (int * int) ) (group: offset_group): offset_group = {
    offsets = offset :: group.offsets;
    can_move = group.can_move;
    can_capture = group.can_capture;
  }

let create_move_vector_group ~vectors ~max_iterations ~can_capture ~can_move ~file_symmetric ~ rank_symmetric = {
  vectors = vectors;
  max_iterations = max_iterations;
  can_capture = can_capture;
  can_move = can_move;
  file_symmetric = file_symmetric;
  rank_symmetric = rank_symmetric;
}

let create_offset_group ~offsets ~can_capture ~can_move =
  { offsets; can_capture; can_move; }

let create ~name ~move_vectors =
  { name; move_vectors; }

let name piece_type = piece_type.name

let move_vectors piece_type = piece_type.move_vectors

let get_expanded_vectors (mv_group : move_vector_group) : expanded_move_vector_group =
  let base_vectors = mv_group.vectors in
  let symmetric_vectors =
    List.fold_left (fun acc (x, y) ->
      let acc = if mv_group.file_symmetric then (-x, y) :: acc else acc in
      let acc = if mv_group.rank_symmetric then (x, -y) :: acc else acc in
      let acc =
        if mv_group.file_symmetric && mv_group.rank_symmetric then
          (-x, -y) :: acc
        else acc
      in
      acc
    ) [] base_vectors
  in
  {
    vectors = List.sort_uniq compare (base_vectors @ symmetric_vectors);
    max_iterations = mv_group.max_iterations;
    can_capture = mv_group.can_capture;
    can_move = mv_group.can_move;
  }

let rec move_offsets_helper (vectors : (int * int) list) (acc : offset_group) (max_iterations : int) =
  match vectors with
  | [] -> acc
  | (x, y) :: rest ->
      let rec move_offsets_iterator iteration acc =
        if iteration > max_iterations then acc
        else
          let my_offset = (x * iteration, y * iteration) in
          move_offsets_iterator (iteration + 1) (add_offset my_offset acc)
      in
      let acc = move_offsets_iterator 1 acc in
      move_offsets_helper rest acc max_iterations

let move_offsets ~expanded_move_vector_group =
  move_offsets_helper
    expanded_move_vector_group.vectors
    (create_offset_group
       ~offsets:[]
       ~can_capture:expanded_move_vector_group.can_capture
       ~can_move:expanded_move_vector_group.can_move)
    expanded_move_vector_group.max_iterations

let move_offsets ~move_vector_group =
  move_offsets ~expanded_move_vector_group:(get_expanded_vectors move_vector_group)
