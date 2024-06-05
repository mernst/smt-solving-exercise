public class Abs {

  /** Computes |x| + |y|. */
  public int absSum(int x, int y) {
    int a1 = x;
    int a2 = y;
    if (x < 0) {
      a1 = -1 * x;
    }
    if (y < 0) {
      a2 = -1 * y;
    }
    int a3 = a1 + a2;
    return a3;
  }

  // End of original code.
}
