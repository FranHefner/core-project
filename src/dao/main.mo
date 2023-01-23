import Error "mo:base/Error";
import ProposalService "services/proposalService";
import PrincipalServices "services/principalServices";
import Text "mo:base/Text";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";
import ProposalsData "repository/proposalsData";
import PrivateTypes "privateTypes/privateTypes";

actor {

    // private stable var _ProposalStable : [(Nat, PrivateTypes.Proposal)] = [];

    var _Proposals : ProposalsData.Proposals = ProposalsData.Proposals();
    var balanceOK : Bool = false;


    public shared ({ caller }) func submit_proposal(textProposal : Text) : async {
        #Ok : ?PrivateTypes.Proposal;
        #Err : Text
    } {
        // balanceOK :=  await PrincipalServices.balance_check(caller);
       
        if (PrincipalServices.isValid(caller) and (await PrincipalServices.balance_check(caller))) {
            return (ProposalService.submitProposal(textProposal, caller, _Proposals))
        } else {
            return #Err("The Principal is not a valid account for this DAO")
        }
    };

    public shared ({ caller }) func vote(proposal_id : Nat, yes_or_no : Bool) : async {
        #Ok : (Nat, Nat);
        #Err : Text
    } {
        if (PrincipalServices.isValid(caller)) {
            return ProposalService.voteProposal(proposal_id, yes_or_no, _Proposals)
        } else {
            return #Err("The Principal is not a valid account for this DAO")
        }
    };

    public query func get_proposal(id : Nat) : async ?PrivateTypes.Proposal {
        return _Proposals.getProposals(id)
    };

    public query func get_all_proposals() : async [(Nat, PrivateTypes.Proposal)] {
        return _Proposals.getAllProposals()
    };

  
 
    public func balance_check2 ( principal: Principal): async Nat {

         let balance : actor { icrc1_balance_of : ({owner : Principal; subbacount:?[Nat8]}) -> async Nat} = actor "db3eq-6iaaa-aaaah-abz6a-cai";
        
         let response = await balance.icrc1_balance_of({ owner = principal; subbacount = null});
         
         return response;        
    };

  

    
}
