/**
 * @author Francisco Miguel Arámburo Torres - atfm05@gmail.com
 */

package compute

/**
 * All the implemented graph algorithms must be registered in
 * this module for requests references.
 */
object Library {
  
  /**
   * Checks for the existance of a graph algorithm.
   *
   * @param algorithm string to be seached.
   * @return the object module of the corresponding algorithm.
   *         'None' if there was no matching algorithm.
   */
  def apply (algorithm: String): Option[String] = {
    algorithm match {
      case "Closeness" => Some("Closeness")
      // Here add more cases for more algorithms.
      case _ => None
    }
  }

}
