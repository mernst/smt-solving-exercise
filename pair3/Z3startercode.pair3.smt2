;; MyInt: This sort represents 8-bit bitvecs.
(define-sort MyInt () (_ BitVec 8))

;; These represent the parameters to our method.
(declare-const a MyInt)
(declare-const b MyInt)
(declare-const c MyInt)

;; The final value of `trian`.
(declare-const trian  MyInt)

;; Since the `trian` variable gets updated throughout the `classify` method,
;; we break it up into variables, corresponding to the
;; amount added to `trian` on lines 21, 24, and 27 respectively.
(declare-const increment21 MyInt)
(declare-const increment24 MyInt)
(declare-const increment27 MyInt)

(assert (= trian (bvadd increment21 increment24 increment27)))

;; The course staff has defined a variable for each conditional in an `if`
;; statement.  The variables are named by their line numbers.
(declare-const line-16-cond bool) ; if (a <= 0 || b <= 0 || c <= 0)
(declare-const line-20-cond bool) ; if (a == b)
(declare-const line-23-cond bool) ; if (a == c)
(declare-const line-26-cond bool) ; if (b == c)
(declare-const line-29-cond bool) ; if (trian == 0)
(declare-const line-30-cond bool) ; if (a + b <= c || a + c <= b || b + c <= a)

;; Assign the values of some of the conditionals (you will do the rest).
(assert (=  line-16-cond (or  (bvsle a #x00)
                              (bvsle b #x00)
                              (bvsle c #x00))))
(assert (= increment21 (if_then_else line-20-cond #x01 #x00)))
(assert (= increment24 (if_then_else line-23-cond #x02 #x00)))
(assert (= increment27 (if_then_else line-26-cond #x03 #x00)))

(declare-const initial-condition bool)
(declare-const mutated-condition bool)

;; Here is the diff between the original program and the mutant.
;; @@ -30 +30 @@
;; -            if (a + b <= c || a + c <= b || b + c <= a) {
;; +            if (a + b <= c || a + c <= b || b + c < a) {

;;;;;;;;;;;;;;;;; START STUDENT CODE ;;;;;;;;;;;;;;;

;; TODO 1: Much of what you did for `pair2` applies here. Copy/paste applicable
;;   constraints that you wrote for `pair2` below.


;; TODO 2: The mutant is on line 30. If the mutant is to behave differently than
;;   the original program, this mutation needs to be executed. With this in
;;   mind, what can we conclude about the condition on line 29? Issue a
;;   constraint to enforce this.


;; TODO 3: The original condition on line 30 is of the form
;;
;;     `A || B || C1`,
;;
;;   and the mutant is of the form
;;
;;     `A || B || C2`,
;;
;;   where
;;
;;     A  := `a + b <= c`,
;;     B  := `a + c <= b`,
;;     C1 := `b + c <= a`,
;;     C2 := `b + c <  a`.
;;
;;   Recalling that the `||` operator is short-circuiting, what can you say
;;   truth values of expressions A and B whenever the mutated expression
;;   C2 is executed? Use this observation to issue constraints for expressions
;;   A and B.


;; TODO 3: Suppose that, for a given input, expression C1 executes in the
;;   original program and expression C2 executes in the mutant.  Further suppose
;;   that these executions lead to the original and the mutated method returning
;;   different values. What can you conclude about the values of `C1` and `C2`?
;;   Issue a constraint capturing this behavior.


;; TODO 4: Run this file through Z3...is the mutant equivalent, or not?

;;;;;;;;;;;;;;;;; END STUDENT CODE ;;;;;;;;;;;;;;;

(check-sat)
;; If needed, run
;; (echo "-------------------------------- Getting model ---------------------------------")
;; (get-model)

