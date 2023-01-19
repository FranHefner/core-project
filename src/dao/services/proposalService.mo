import Bool "mo:base/Bool";
import ProposalTye "../privateTypes/proposalTye";
import ProposalsData "../repository/proposalsData";
import Text "mo:base/Text";

module ProposalService {

    public func valitations(proposal : Text) : async Bool {

        if (textProposal.equal("")) {
            return false
        } else {
            return true
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

    public func submitProposal(textProposal : Text, principal: Principal )  : async {
        #Ok : ProposalTye.Proposal;
        #Err : Text
    } {

        if (valitations(textProposal)) {

            let id : Nat = proposalsIdCount;
            proposalsIdCount += 1;

             let proposal : ProposalTye.Proposal  = {                    
                        userPrincipal  = principal;
                        title  = Text.extract(textProposal,0,47);
                        description = textProposal;
                        voteCount = 0;
                        state = State.Open;
                };
            
            ProposalsData.proposals.put(id, proposal);
            let pRes : ?ProposalTye.Proposal = getProposal(id);

            switch (pRes) {
            case (null) {
                return #Error("There was an error adding the proposal, please try again")
            };

            case (?proposal) {
                return #Ok(pRes)
            };
            }
          
        } else {
           return #Error("The proposal did not satisfactorily pass the validations..")
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

                 let updateProposal : ProposalTye.Proposal  = {                    
                        userPrincipal  = proposal.userPrincipal;
                        title  = proposal.title;
                        description = proposal.description;
                        voteCount = voteCount + 1;
                        state = proposal.state;
                };

                 posts.put(proposal_id, updatedPost);

                   return #Ok; // Todo:  Devolver   (Nat, Nat);                     


        } else {
            return validOK
        }
    }
}
