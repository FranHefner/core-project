import Bool "mo:base/Bool";
import ProposalsDATA "../repository/proposalsData";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import HashMap "mo:base/HashMap";
import PrivateTypes "../privateTypes/privateTypes";

module ProposalService {

    public func valitations(proposal : Text) : Bool {

        if (proposal == "") {
            return false
        } else {
            return true
        }
    };

    public func voteValidataions(proposal_id : Nat, pDATA : ProposalsDATA.Proposals) : Text {

        let pRes : ?PrivateTypes.Proposal = pDATA.getProposals(proposal_id);

        switch (pRes) {
            case (null) {
                return ("You're trying to update a non-existent Proposal.")
            };
            case (?proposal) {
                let stateProposal : PrivateTypes.State = proposal.state;

                switch (stateProposal) {
                    case (#Adopted) {
                        return ("You're trying to vote a Adopted Proposal.")
                    };
                    case (#Executed) {
                        return ("You're trying to update a Executed Proposal.")
                    };
                    case (#Rejected) {
                        return ("You're trying to update a Rejected Proposal.")
                    };
                    case (#Failed) {
                        return ("You're trying to update a Failed Proposal.")
                    };
                    case (#Open) {
                        return ("OK")
                    }
                }
            }
        }
    };

    public func submitProposal(textProposal : Text, principal : Principal, pDATA : ProposalsDATA.Proposals) : {
        #Ok : ?PrivateTypes.Proposal;
        #Err : Text
    } {

        if (valitations(textProposal) == true) {

            let proposal : PrivateTypes.Proposal = {
                userPrincipal = principal;
                title = textProposal; // Text.extract(textProposal,0,47);
                description = textProposal;
                voteCount = 0;
                state = #Open
            };

            pDATA.setProposals(proposal);

            let pRes : ?PrivateTypes.Proposal = pDATA.getProposals(pDATA.getProposalsSize());

            switch (pRes) {
                case (null) {
                    return #Err("There was an error adding the proposal, please try again")
                };

                case (?propuestaOK) {
                    return #Ok(pRes)
                }
            }

        } else {
            return #Err("The proposal did not satisfactorily pass the validations..")
        }

    };

    public func voteProposal(proposal_id : Nat, yes_or_no : Bool, pDATA : ProposalsDATA.Proposals, votingPower : Nat) : {
        #Ok : (Nat, Nat);
        #Err : Text
    } {

        if (voteValidataions(proposal_id, pDATA) == ("OK")) {

            let pRes : ?PrivateTypes.Proposal = pDATA.getProposals(proposal_id);

            switch (pRes) {
                case (null) {
                    return #Err("There was an error adding the vote, please try again")
                };

                case (?propuestaOK) {
                    var voteCount : Nat = propuestaOK.voteCount;

                    var newState : PrivateTypes.State = #Open;
                    if (votingPower + propuestaOK.voteCount > 100) // TODO: Upgrade calc voting power
                    {
                        newState := #Adopted
                    };
                    var updateProposal : PrivateTypes.Proposal = {
                        userPrincipal = propuestaOK.userPrincipal;
                        title = propuestaOK.title;
                        description = propuestaOK.description;
                        voteCount = propuestaOK.voteCount + 1;
                        state = newState
                    };

                    pDATA.updateProposal(proposal_id, updateProposal);

                    return #Ok(proposal_id, voteCount)
                }
            }

        } else {
            return #Err(voteValidataions(proposal_id, pDATA))
        };

    };

}
