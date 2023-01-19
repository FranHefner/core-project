import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";
import Hash "mo:base/Hash";
import Principal "mo:base/Principal";
import Error "mo:base/Error";
import ProposalService "services/proposalService";
import ProposalTye "privateTypes/proposalTye";
import PrincipalServices "services/principalServices";
import Text "mo:base/Text";

actor {

    public shared ({ caller }) func submit_proposal(textProposal : Text) : async {
        #Ok : ProposalTye.Proposal;
        #Err : Text
    } {
        if (PrincipalServices.isValid(caller.caller)) {
            let pRes : ?ProposalTye.Proposal = ProposalService.putProposal(textProposal);
            switch (pRes) {
                case (null) {
                    return #Error("The proposal did not pass the validations satisfactorily")
                };
                case (?pRes) {
                    return #Ok(pRes)
                }
            }
        } else {
            return #Error("The Principal is not a valid account for this DAO")
        }
    };

    public shared ({ caller }) func vote(proposal_id : Int, yes_or_no : Bool) : async {
        #Ok : (Nat, Nat);
        #Err : Text
    } {
        if (PrincipalServices.isValid(caller.caller)) {
            return ProposalService.voteProposal(proposal_id, yes_or_no);
        } else {
            return #Error("The Principal is not a valid account for this DAO")
        }

    };

    public query func get_proposal(id : Int) : async ?ProposalTye.Proposal {
        return ProposalService.getProposal(id)
    };

    public query func get_all_proposals() : async [(Int, ProProposalTye.Proposalposal)] {
        return ProposalService.getAllProposals()
    };

}
