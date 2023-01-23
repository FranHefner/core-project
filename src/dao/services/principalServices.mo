import Principal "mo:base/Principal";
import Bool "mo:base/Bool";

module {


    //Todo add more validations
    public func isValid(principal : Principal) :  Bool {

        return true;
    };


    public func balance_check ( principal: Principal): async Bool {

         var cantTokensOK : Nat = 0;

         let balance : actor { icrc1_balance_of : ({owner : Principal; subbacount:?[Nat8]}) -> async Nat} = actor "db3eq-6iaaa-aaaah-abz6a-cai";
        
         let response = await balance.icrc1_balance_of({ owner = principal; subbacount = null});
               
        cantTokensOK := response;
        
        if (cantTokensOK > 0 ) {            
            return true;
        }else{
            return false;
        }
    };  
     public func getVotingPower ( principal: Principal): async Nat {

        var totalSupply : Nat = 0;
        var cantTokens: Nat = 0;
        var votingPower : Nat = 0;

         let balance : actor { icrc1_balance_of : ({owner : Principal; subbacount:?[Nat8]}) -> async Nat} = actor "db3eq-6iaaa-aaaah-abz6a-cai";
        
         let response = await balance.icrc1_balance_of({ owner = principal; subbacount = null});
               
        cantTokens := response;    

        votingPower := response;  // TODO: "Supply/cantTokens" or similar
    
        return  votingPower; 
    };  


}
