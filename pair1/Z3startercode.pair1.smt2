;; In this exercise you will issue constraints to Z3 that asserts that the
;; following two programs are not equivalent:
;;
;;    public int sum(int x, int y, int z) {
;;      int a1 = x + y;
;;      int a2 = a1 + z;
;;      return a2;
;;    }
;;
;; and
;;
;;    public int sum(int x, int y, int z) {
;;      int a1 = x + y;
;;      int a2 = a1 - z;
;;      return a2;
;;    }

;; MyInt: This sort represents 8-bit bitvecs.
(define-sort MyInt () (_ BitVec 8))

;; These represent the parameters to the method.
(declare-const x MyInt)
(declare-const y MyInt)
(declare-const z MyInt)

(declare-const a1 MyInt)
(declare-const a2 MyInt)
(declare-const mutated_a2 MyInt)

;;;;;;;;;;;;;;;;; START STUDENT CODE ;;;;;;;;;;;;;;;

;; TODO: Replace this line by constraints that determine equivalence of the above programs.

;;;;;;;;;;;;;;;;; END STUDENT CODE ;;;;;;;;;;;;;;;

(echo "Checking Satisfiability:")
(check-sat)
;; If needed, run
;; (echo "-------------------------------- Getting model ---------------------------------")
;; (get-model)
