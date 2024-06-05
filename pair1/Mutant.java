public class Mutant { // The mutation is on line 6.

  /** Might or might not compute x + y + z. */
  public int mutated_sum(int x, int y, int z) {
    int a1 = x + y;
    int a2 = a1 - z; // mutation here.  The "-" used to be "+".
    return a2;
  }
}
