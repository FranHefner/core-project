import Principal "mo:base/Principal";
import Bool "mo:base/Bool";


module{


     public func isValid(principal:Principal) : Bool {    
        return true; // Todo: Agregar Validaciones. Como si tiene tokens para pertenecer al DAO
    }; 

    //Todo verificar cantidad token y devolver el voting power
/*
   public shared (msg) func whoami() : async Principal {
        msg.caller;
    };
*/

}