(* This file is generated by Why3's Coq driver *)
(* Beware! Only edit allowed sections below    *)
Require Import BuiltIn.
Require BuiltIn.
Require int.Int.
Require int.Abs.
Require int.ComputerDivision.
Require map.Map.

(* Why3 assumption *)
Definition unit := unit.

Axiom t : Type.
Parameter t_WhyType : WhyType t.
Existing Instance t_WhyType.

Parameter max: Z.

Parameter to_int: t -> Z.

(* Why3 assumption *)
Definition in_bounds (n:Z): Prop := (0%Z <= n)%Z /\ (n <= max)%Z.

Axiom to_int_in_bounds : forall (n:t), (in_bounds (to_int n)).

Axiom extensionality : forall (x:t) (y:t), ((to_int x) = (to_int y)) ->
  (x = y).

Parameter zero_unsigned: t.

Axiom zero_unsigned_is_zero : ((to_int zero_unsigned) = 0%Z).

Axiom uint256 : Type.
Parameter uint256_WhyType : WhyType uint256.
Existing Instance uint256_WhyType.

Parameter to_int1: uint256 -> Z.

(* Why3 assumption *)
Definition in_bounds1 (n:Z): Prop := (0%Z <= n)%Z /\
  (n <= 115792089237316195423570985008687907853269984665640564039457584007913129639935%Z)%Z.

Axiom to_int_in_bounds1 : forall (n:uint256), (in_bounds1 (to_int1 n)).

Axiom extensionality1 : forall (x:uint256) (y:uint256),
  ((to_int1 x) = (to_int1 y)) -> (x = y).

Parameter zero_unsigned1: uint256.

Axiom zero_unsigned_is_zero1 : ((to_int1 zero_unsigned1) = 0%Z).

(* Why3 assumption *)
Inductive array (a:Type) :=
  | mk_array : Z -> (map.Map.map Z a) -> array a.
Axiom array_WhyType : forall (a:Type) {a_WT:WhyType a}, WhyType (array a).
Existing Instance array_WhyType.
Implicit Arguments mk_array [[a]].

(* Why3 assumption *)
Definition elts {a:Type} {a_WT:WhyType a} (v:(array a)): (map.Map.map Z a) :=
  match v with
  | (mk_array x x1) => x1
  end.

(* Why3 assumption *)
Definition length {a:Type} {a_WT:WhyType a} (v:(array a)): Z :=
  match v with
  | (mk_array x x1) => x
  end.

(* Why3 assumption *)
Definition get {a:Type} {a_WT:WhyType a} (a1:(array a)) (i:Z): a :=
  (map.Map.get (elts a1) i).

(* Why3 assumption *)
Definition set {a:Type} {a_WT:WhyType a} (a1:(array a)) (i:Z) (v:a): (array
  a) := (mk_array (length a1) (map.Map.set (elts a1) i v)).

Parameter lookup: (array uint256) -> Z -> Z.

Axiom lookup_get : forall (a:(array uint256)) (idx:Z), ((lookup a
  idx) = (to_int1 (get a idx))).

Parameter sum: (array uint256) -> Z -> Z -> Z.

Axiom Sum_def_empty : forall (c:(array uint256)) (i:Z) (j:Z), (j <= i)%Z ->
  ((sum c i j) = 0%Z).

Axiom Sum_def_non_empty : forall (c:(array uint256)) (i:Z) (j:Z),
  (i < j)%Z -> ((sum c i j) = ((lookup c i) + (sum c (i + 1%Z)%Z j))%Z).

Axiom Sum_right_extension : forall (c:(array uint256)) (i:Z) (j:Z),
  (i < j)%Z -> ((sum c i j) = ((sum c i (j - 1%Z)%Z) + (lookup c
  (j - 1%Z)%Z))%Z).

Axiom Sum_transitivity : forall (c:(array uint256)) (i:Z) (k:Z) (j:Z),
  ((i <= k)%Z /\ (k <= j)%Z) -> ((sum c i j) = ((sum c i k) + (sum c k
  j))%Z).

Axiom Sum_eq : forall (c1:(array uint256)) (c2:(array uint256)) (i:Z) (j:Z),
  (forall (k:Z), ((i <= k)%Z /\ (k < j)%Z) -> ((lookup c1 k) = (lookup c2
  k))) -> ((sum c1 i j) = (sum c2 i j)).

Axiom ltle_eq : forall (x:Z) (y:Z), (x < (y + 1%Z)%Z)%Z -> ((y <= x)%Z ->
  (y = x)).

Axiom sum_end_no_change : forall (usorig:(array uint256)) (usidx:Z)
  (usnew_val:uint256), ((sum (set usorig usidx usnew_val) 0%Z
  usidx) = (sum usorig 0%Z usidx)).

Axiom lookup_set_different : forall (usorig:(array uint256)) (usidx:Z)
  (usnew_val:uint256) (x:Z), (usidx < x)%Z -> ((lookup (set usorig usidx
  usnew_val) x) = (lookup usorig x)).

Axiom balanceSubCoq0S : forall (x:Z), (0%Z <= x)%Z -> ((forall (usorig:(array
  uint256)) (usidx:Z) (usval:uint256) (usnew_val:uint256),
  ((to_int1 usnew_val) = ((to_int1 (get usorig
  usidx)) - (to_int1 usval))%Z) -> (((0%Z <= usidx)%Z /\ (usidx < x)%Z) ->
  ((sum (set usorig usidx usnew_val) 0%Z x) = ((sum usorig 0%Z
  x) - (to_int1 usval))%Z))) -> forall (usorig:(array uint256)) (usidx:Z)
  (usval:uint256) (usnew_val:uint256),
  ((to_int1 usnew_val) = ((to_int1 (get usorig
  usidx)) - (to_int1 usval))%Z) -> (((0%Z <= usidx)%Z /\
  (usidx < (x + 1%Z)%Z)%Z) -> ((sum (set usorig usidx usnew_val) 0%Z
  (x + 1%Z)%Z) = ((sum usorig 0%Z (x + 1%Z)%Z) - (to_int1 usval))%Z))).

Axiom balanceSubCoq00 : forall (usorig:(array uint256)) (usidx:Z)
  (usval:uint256) (usnew_val:uint256),
  ((to_int1 usnew_val) = ((to_int1 (get usorig
  usidx)) - (to_int1 usval))%Z) -> (((0%Z <= usidx)%Z /\ (usidx < 0%Z)%Z) ->
  ((sum (set usorig usidx usnew_val) 0%Z 0%Z) = ((sum usorig 0%Z
  0%Z) - (to_int1 usval))%Z)).

Axiom balanceSubCoq0 : forall (uslim:Z), (0%Z <= uslim)%Z ->
  forall (usorig:(array uint256)) (usidx:Z) (usval:uint256)
  (usnew_val:uint256), ((to_int1 usnew_val) = ((to_int1 (get usorig
  usidx)) - (to_int1 usval))%Z) -> (((0%Z <= usidx)%Z /\
  (usidx < uslim)%Z) -> ((sum (set usorig usidx usnew_val) 0%Z
  uslim) = ((sum usorig 0%Z uslim) - (to_int1 usval))%Z)).

Axiom balanceSub : forall (uslim:Z) (usorig:(array uint256)) (usidx:Z)
  (usval:uint256) (usnew_val:uint256),
  ((to_int1 usnew_val) = ((to_int1 (get usorig
  usidx)) - (to_int1 usval))%Z) -> (((0%Z <= usidx)%Z /\
  (usidx < uslim)%Z) -> ((sum (set usorig usidx usnew_val) 0%Z
  uslim) = ((sum usorig 0%Z uslim) - (to_int1 usval))%Z)).

Axiom balanceAddCoq0S : forall (x:Z), (0%Z <= x)%Z -> ((forall (usorig:(array
  uint256)) (usidx:Z) (usval:uint256) (usnew_val:uint256),
  ((to_int1 usnew_val) = ((to_int1 (get usorig
  usidx)) + (to_int1 usval))%Z) -> (((0%Z <= usidx)%Z /\ (usidx < x)%Z) ->
  ((sum (set usorig usidx usnew_val) 0%Z x) = ((sum usorig 0%Z
  x) + (to_int1 usval))%Z))) -> forall (usorig:(array uint256)) (usidx:Z)
  (usval:uint256) (usnew_val:uint256),
  ((to_int1 usnew_val) = ((to_int1 (get usorig
  usidx)) + (to_int1 usval))%Z) -> (((0%Z <= usidx)%Z /\
  (usidx < (x + 1%Z)%Z)%Z) -> ((sum (set usorig usidx usnew_val) 0%Z
  (x + 1%Z)%Z) = ((sum usorig 0%Z (x + 1%Z)%Z) + (to_int1 usval))%Z))).

Axiom balanceAddCoq00 : forall (usorig:(array uint256)) (usidx:Z)
  (usval:uint256) (usnew_val:uint256),
  ((to_int1 usnew_val) = ((to_int1 (get usorig
  usidx)) + (to_int1 usval))%Z) -> (((0%Z <= usidx)%Z /\ (usidx < 0%Z)%Z) ->
  ((sum (set usorig usidx usnew_val) 0%Z 0%Z) = ((sum usorig 0%Z
  0%Z) + (to_int1 usval))%Z)).

(* Why3 goal *)
Theorem balanceAddCoq0 : forall (uslim:Z), (0%Z <= uslim)%Z ->
  forall (usorig:(array uint256)) (usidx:Z) (usval:uint256)
  (usnew_val:uint256), ((to_int1 usnew_val) = ((to_int1 (get usorig
  usidx)) + (to_int1 usval))%Z) -> (((0%Z <= usidx)%Z /\
  (usidx < uslim)%Z) -> ((sum (set usorig usidx usnew_val) 0%Z
  uslim) = ((sum usorig 0%Z uslim) + (to_int1 usval))%Z)).
Proof.
  apply (natlike_ind _ balanceAddCoq00 balanceAddCoq0S).

Qed.

