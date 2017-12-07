(*
 * OWL - an OCaml numerical library for scientific computing
 * Copyright (c) 2016-2017 Liang Wang <liang.wang@cl.cam.ac.uk>
 *)

(** View module
  This module is used to create views atop of an ndarray. The view creation is
  very light-weighted and avoids copying actual data. You can further create
  views atop of existing views using slicing functions.

  All the views share the same underlying ndarray and any modification will be
  reflected on the original ndarray.
 *)

open Owl_types

module Make
  (A : InpureSig)
  : sig

  type t
  (** [t] is the abstract type to represent a view atop of an ndarray. *)


  (** {6 Core functions} *)

  val of_arr : A.arr -> t

  val to_arr : t -> A.arr


  (** {6 Manipulation functions} *)

  val get : t -> int array -> A.elt

  val set : t -> int array -> A.elt -> unit

  val get_slice_simple : int list list -> t -> t

  val num_dims : t -> int

  val shape : t -> int array


  (** {6 Iteration functions} *)

  val iteri : (int -> A.elt -> unit) -> t -> unit

  val iter : (A.elt -> unit) -> t -> unit

  val mapi : (int -> A.elt -> A.elt) -> t -> unit

  val map : (A.elt -> A.elt) -> t -> unit


end
