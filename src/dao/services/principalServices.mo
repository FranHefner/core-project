
import Principal "mo:base/Principal";
import Bool "mo:base/Bool";


module PrincipalService {



    public func isValid(principal : Principal) : async Bool {        
        return true; // Todo: Agregar Validaciones. Como si tiene tokens para pertenecer al DAO
    }; 

   public shared (msg) func whoami() : async Principal {
        msg.caller;
    };

}