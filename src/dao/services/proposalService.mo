import Bool "mo:base/Bool";
import ProposalTye "../privateTypes/proposalTye";


module ProposalService {

 
   

  //-----
    public func valitations(proposal : Text) : async Bool {

        if (textProposal.equal("")) {
            return true
        } else {
            return false
        }
    };   

}