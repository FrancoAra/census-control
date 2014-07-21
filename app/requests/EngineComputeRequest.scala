/**
 * @author Francisco Miguel Arámburo Torres - atfm05@gmail.com
 */

package requests

import scala.concurrent.future
import play.api.libs.concurrent.Execution.Implicits._
import play.api.libs.json._

import library.Library
import engine.GraphCompute

/**
 * An in queue request that executes a
 * graph algorithm in the library.
 *
 * @param json of the request.
 */
class EngineComputeRequest (json: JsValue) extends Request {

  /** The request uniquer identifier. */
  val token: String = 
    (json \ "token").asOpt[String] match {
      case None => errors += "'token' field missing."; ""
      case Some(data) => data
    }

  /** Algorithm to be executed. */
  val algorithm: GraphCompute =
    (json \ "algorithm").asOpt[String] match {
      case None => errors += "'algorithm' field missing."; ""
      case Some(data) => Library(data) match {
        case None => errors += s"No such algorithm '$data'"; ""
        case Some(algo) => algo
      }
    }

  /** Variables that the algorithm will use for the computation. */
  val vars: Array[String] =
    (json \ "vals").asOpt[Array[String]] match {
      case None => Array[String]()
      case Some(data) => data
    }

}
