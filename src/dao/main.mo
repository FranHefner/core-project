import Error "mo:base/Error";
import ProposalTye "privateTypes/proposalTye";
import ProposalService "services/proposalService";
import PrincipalServices "services/principalServices";
import Text "mo:base/Text";
import Principal "mo:base/Principal";
import HashMap "mo:base/HashMap";

actor {
      /*  var proposals = HashMap.HashMap<Int, ProposalTye.Proposal>(1, Int.equal, Hash.hash);
        var proposalsIdCount : Nat = 0;*/

    public shared ({ caller }) func submit_proposal(textProposal : Text) : async {
        #Ok : ProposalTye.Proposal;
        #Err : Text
    } {
        if (PrincipalServices.isValid(caller)) { // Todo: Revisar como pasar el contexto con el principal
            return ProposalService.submitProposal(textProposal, caller ) // Todo: Revisar como pasarle el principal " caller.getPrincial() "" 
        } else {
            return #Err("The Principal is not a valid account for this DAO")
        }
    };

    public shared ({ caller }) func vote(proposal_id : Nat, yes_or_no : Bool) : async {
        #Ok : (Nat, Nat);
        #Err : Text
    } {
        if (PrincipalServices.isValid(caller.Principal)) {
            return ProposalService.voteProposal(proposal_id, yes_or_no)
        } else {
            return #Err("The Principal is not a valid account for this DAO")
        }
    };

    public query func get_proposal(id : Nat) : async ?ProposalTye.Proposal {

        if (PrincipalServices.isValid(caller.Principal)) {
            return ProposalService.getProposal(id)
        } else {
            return null
        }
    };

    public query func get_all_proposals() : async [(Nat, ProProposalTye.Proposalposal)] {

        if (PrincipalServices.isValid(caller.Principal)) {
            return ProposalService.getAllProposals()
        } else {
            return null
        }
    };

}
