(* this is a proof for the theorem forall A : A-> A*)
Theorem my_first_proof : (forall A:Prop , A -> A).
Proof.
  (*intros A can be considered as "assume A"*)
  intros A.

  (* and intros proof_of_A is equivalent to "assume a proof for A"*)
  intros proof_of_A.

  (*Now once the above two commands are executed the subgoal that left is 
   to exact something that is of type A which turns out to be proof_of_A *)
  exact proof_of_A.
Defined.

Theorem forward_small : (forall A B:Prop , A -> (A -> B ) -> B).
Proof.
  (* you can either have
     intros A.
     intros B.
   or
     intros A B.
   both have the same meaning*)
  intros A B
  .
  (* asssumes that A has a proof*)
  intros proof_of_A.

  (* assumes A->B has a proof*)
  intros A_implies_B.

  (* pose can be considered as function application which yeilds a proof for B*)
  pose (proof_of_B := A_implies_B proof_of_A).

  (* the subgoal will be a proof for be and since we have a Definition for it we can exact it*)
  exact proof_of_B.
Defined.

(* refine operator also works in somewhat similar way*)
Theorem forward_small_refine : (forall A B:Prop , A -> (A->B) -> B).
Proof.
  intros A.
  intros B.
  intros proof_of_A.
  intros A_implies_B.
  refine (A_implies_B _).
  exact proof_of_A.
Qed.

