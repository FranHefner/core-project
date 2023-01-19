import Bool "mo:base/Bool";
import ProposalTye "../privateTypes/proposalTye";
import ProposalsData "../repository/proposalsData";
import Text "mo:base/Text";

module ProposalService {

    public func valitations(proposal : Text) : async Bool {

        if (textProposal.equal("")) {
            return true
        } else {
            return false
        }
    };

    public func voteValidataions(idProposal : Int) : async {
        #Ok : Text;
        #Err : Text
    } {

        let proposal : ?ProposalTye.Proposal = getProposal(idProposal);

        switch (proposal) {
            case (null) {
                return #Error("You're trying to update a non-existent Proposal.")
            };
            case (?proposal) {
                let stateProposal : ProposalType.State = proposal.state;

                switch (stateProposal) {
                    case (Adopted) {
                        return #Err("You're trying to vote a Adopted Proposal.")
                    };
                    case (Executed) {
                        return #Err("You're trying to update a Executed Proposal.")
                    };
                    case (Rejected) {
                        return #Err("You're trying to update a Rejected Proposal.")
                    };
                    case (Failed) {
                        return #Err("You're trying to update a Failed Proposal.")
                    };
                    case (Open) {
                        return #OK("The proposal is open to vote")
                    }
                }
            }
        }
    };

    public func putProposal(textProposal : Text) : async ?ProposalTye.Proposal {

        if (valitations(textProposal)) {
            let id : Nat = proposalsIdCount;
            proposalsIdCount += 1;
            ProposalsData.proposals.put(id, ProposalsData.proposals);
            let pRes : ?ProposalTye.Proposal = getProposal(id);
            return pRes
        } else {
            return null
        }

    };

    public func getProposal(id : Int) : async ProposalTye.Proposal {

        return let pRes : ?ProposalTye.Proposal = ProposalsData.proposals.get(id);

    };

    public func getAllProposals() : async [(Int, ProProposalTye.Proposalposal)] {
        let proposalIter : Iter.Iter<(Nat, ProposalTye.Proposal)> = ProposalsData.proposals.entries();
        let proposalArray : [(Nat, ProposalTye.Proposal)] = Iter.toArray(proposalIter);

        return postsArray
    };

    public func voteProposal(proposal_id : Int, yes_or_no : Bool) : async {
        #Ok : (Nat, Nat);
        #Err : Text
    } {
        let validOK : Text = voteValidataions(proposal_id);

        if (validOK == #Ok) {

            let proposal : ?ProposalTye.Proposal = getProposal(idProposal);

        } else {
            return validOK
        }

    }
}
