import Error "mo:base/Error";
import ProposalTye "privateTypes/proposalTye";
import ProposalService "services/proposalService";
import PrincipalServices "services/principalServices";
import Text "mo:base/Text";
import Principal "mo:base/Principal";

actor {

    public shared ({ caller }) func submit_proposal(textProposal : Text) : async {
        #Ok : ProposalTye.Proposal;
        #Err : Text
    } {
        if (PrincipalServices.isValid(caller.caller)) {
            return ProposalService.submitProposal(textProposal, caller.getPrincial() ) // Todo: Revisar como pasarle el principal " caller.getPrincial() "" 
        } else {
            return #Error("The Principal is not a valid account for this DAO")
        }
    };

    public shared ({ caller }) func vote(proposal_id : Int, yes_or_no : Bool) : async {
        #Ok : (Nat, Nat);
        #Err : Text
    } {
        if (PrincipalServices.isValid(caller.caller)) {
            return ProposalService.voteProposal(proposal_id, yes_or_no)
        } else {
            return #Error("The Principal is not a valid account for this DAO")
        }
    };

    public query func get_proposal(id : Int) : async ?ProposalTye.Proposal {

        if (PrincipalServices.isValid(caller.caller)) {
            return ProposalService.getProposal(id)
        } else {
            return null
        }
    };

    public query func get_all_proposals() : async [(Int, ProProposalTye.Proposalposal)] {

        if (PrincipalServices.isValid(caller.caller)) {
            return ProposalService.getAllProposals()
        } else {
            return null
        }
    };

}
