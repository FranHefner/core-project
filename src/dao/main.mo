import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";
import Hash "mo:base/Hash";
import Principal "mo:base/Principal";
import ProposalTye "privateTypes/proposalTye";
import ProposalService "service/proposalService";
import ProposalTye "privateTypes/proposalTye";
import Error "mo:base/Error";

actor {
     // codigo del modulo repository -> proposalData
        var proposals = HashMap.HashMap<Nat, ProposalType.Proposal>(1, Nat.equal, Hash.hash);
        stable var proposalsIdCount : Nat = 0;

    /// Funciones del modulo proposalService.
    //-----
    public func valitations(proposal : Text) : async Bool {

        if (textProposal.equal("")) {
            return true
        } else {
            return false
        }
    };   
    public func putProposal (proposal : Text): async ProposalType.Proposal {
          
          
          proposalsIdCount += 1;
          proposals.put(id, ProposalType.Proposal);
          let pRes : ?Proposal = proposals.get(id);

          return pRes;
        
    };
    //----------------

    public shared ({ caller }) func submit_proposal(textProposal : Text) : async {
        #Ok : Proposal;
        #Err : Text
    } {
         let id : Nat = proposalsIdCount;

         if (valitations(textProposal)){

                putProposal(textProposal)

                 


            return #Ok("The proposal was successful :" + pRes);

         }else{
             return #Error ("The proposal did not pass the validations satisfactorily");
         }
    };

    public shared ({ caller }) func vote(proposal_id : Int, yes_or_no : Bool) : async {
        #Ok : (Nat, Nat);
        #Err : Text
    } {

        let pRes : ?Post = proposals.get(id);

        /*  switch (pRes) {
        case (null) {
            "The proposal that you are wanting to vote on does not accept votes.";
        };
        case (?currentPost) {

        
        return #Err("Not implemented yet");*/
    };

    public query func get_proposal(id : Int) : async ?Proposal {
        return null
    };

    public query func get_all_proposals() : async [(Int, Proposal)] {
        return []
    };

}
