# SMT solving exercise

## Goal

The goal of this exercise is to learn about Z3, a SMT (Satisfiability Modulo Theories)
solver.  You will see how Z3 can model programs, prove
program properties, and generate test cases.


## Setup

1. Ensure you can run Z3.

   * You can use Z3 in your browser:
     [1](https://www.philipzucker.com/z3-rise4fun/),
     [2](https://microsoft.github.io/z3guide/),
     [3](https://compsys-tools.ens-lyon.fr/z3/).

   * You can install Z3 locally.
     It is likely in a package manager; for example, on Debian or Ubuntu, run `apt-get install z3`.
     Otherwise, download the latest [Z3 release](https://github.com/Z3Prover/z3/releases).

2. Read "Introduction" and "Basic Commands" in the [Z3
   Tutorial](https://www.philipzucker.com/z3-rise4fun/guide.html).
   While doing the exercise, you may wish to search it for additional information.

## Instructions

In this repository:
 * Each `pairN` directory contains a program, a mutated
   version named `Mutant.java`, and z3 starter code for comparing the two.
 * Each `setN` directory contains an original program, a
   set of four mutants in `Mutants.java`, and z3 starter code.

All of the code in this exercise uses width-8 `BitVec`s instead of 32 or 64
bits. This is for speed of execution and for ease of reading/writing/reasoning:
the principles are the same, but are a little easier to grok at this lower
precision. Recall the `BitVec` operators, such as `bvadd` and `bvsgt`, that
replace Int operators, such as `+` and `>`.


1. For **each of the `pairN` directories**:

   a. **Examine the original and mutated program in the `pair1/` directory.**

       Are they equivalent? (See Question 1 below.)

   b. **Complete `Z3startercode.pairN.smt2` (see hints below!).**

       Your completed code should either prove equivalence of the two programs or
       generate a model (test case) that proves non-equivalence.

   c. **Test your code by running it with Z3.**

       Run the `.smt2` file with Z3.

2. For the **`set1/` directory**:

   a. **Examine the mutants in the `set1/` directory.**

   b. **Use scopes to complete Z3startercode.set1.smt2.**
      Your completed code should, for each mutant, either prove equivalence or
      generate a model (test case) that proves non-equivalence.  (See Question 2
      and 3 below.)

      Recall what you learned about [Z3
      scopes](https://www.philipzucker.com/z3-rise4fun/guide.html) from the [Z3
      Tutorial](https://www.philipzucker.com/z3-rise4fun/guide.html).  Scopes will
      make your code much shorter, because they permit you to reuse constraints
      for code that is identical between the original program and the mutant
      programs.

   c. **Test your code by running it with Z3.**

## Questions

1. Which of the mutants in `pair1/`, `pair2/`, and `pair3/` are equivalent? Provide, for
each non-equivalent mutant, a test case that detects it.
The test case should be the output of the `(get-model)` instruction in your `smt2` code.

2. Which of the four mutants in `set1/` are equivalent? Provide, for each
non-equivalent mutant, a test case that detects it.

3. In your own words, briefly explain how scopes work in Z3 and when they are useful.


## Hints

When modifying the `.smt2` templates, only modify what is **between**

```
;;;;;;;;;;;;;;;;; START STUDENT CODE ;;;;;;;;;;;;;;;
```

and

```
;;;;;;;;;;;;;;;;; END STUDENT CODE ;;;;;;;;;;;;;;;
```

Do not alter anything that is not
between the lines, **including the lines themselves**!
These lines are used for grading.
