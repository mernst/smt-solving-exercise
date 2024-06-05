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
;; @@ -32 +32 @@
;; -        if (trian == 0) {
;; +        if (trian <= 0) {

;;;;;;;;;;;;;;;;; START STUDENT CODE ;;;;;;;;;;;;;;;


;; TODO 1: When the condition on line 20 is `true` the method returns before the
;;    mutation on line 34 is reached. Therefore, we can conclude that
;;    line-20-cond is `false`. Write an assertion to enforce this.


;; TODO 2: Write assertions for the conditions on lines 24, 27, 30, and 33. Note
;;    that while most operators on BitVecs have special names (such as `bvadd`
;;    or `bvsgt`), `=` works everywhere...equality is the only
;;    relation that means the same thing no matter what Sort of thing you are
;;    comparing! This means that you can assert that `Int`s are equal with
;;
;;        `(assert (= myInt 2))`,
;;
;;    and you can assert that `BitVec`s are equal with
;;
;;        `(assert (= myBV #x04))`,
;;
;;    both using the same `=` operator.


;; TODO 3: Write assertions to constrain `initial-condition` and
;; `mutated-condition`.


;;;;;;;;;;;;;;;;; END STUDENT CODE ;;;;;;;;;;;;;;;

(assert (not (= mutated-condition initial-condition)))

(echo "Checking Satisfiability:")
(check-sat)
;; If needed, run
;; (echo "-------------------------------- Getting model ---------------------------------")
;; (get-model)
