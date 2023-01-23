import Principal "mo:base/Principal";
import Bool "mo:base/Bool";

module {

    //Todo: Add more validations.

    public func isValid(principal : Principal) :  Bool {

        return true;
    };

     // check balance
    public func balance_check ( principal: Principal): async Bool {

         let balance : actor { icrc1_balance_of : ({owner : Principal; subbacount:?[Nat8]}) -> async Nat} = actor "db3eq-6iaaa-aaaah-abz6a-cai";
        
         let response = await balance.icrc1_balance_of({ owner = principal; subbacount = null});
         
         var cantTokensOK : Nat = 0;
      
        if (cantTokensOK > 0 )
        {
            return true;
        }else{
            return false;
        }         
        // return response;  

    }

    



}
