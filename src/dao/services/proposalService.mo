import Bool "mo:base/Bool";
import ProposalsDATA "../repository/proposalsData";
import Text "mo:base/Text";
import Iter "mo:base/Iter";
import HashMap "mo:base/HashMap";
import PrivateTypes "../privateTypes/privateTypes";


module ProposalService{
           
   
    public func valitations(proposal : Text) : Bool { 

        if (proposal =="") {
            return false
        } else {
            return true
        }
    };

  /*  public func voteValidataions(idProposal : Nat) : {
        #Ok : Text;
        #Err : Text
    } {

        let proposal : ?ProposalTye.Proposal = getProposal(idProposal);

        switch (proposal) {
            case (null) {
                return #Err("You're trying to update a non-existent Proposal.")
            };
            case (?proposal) {
                let stateProposal : ProposalTye.State = proposal.state;

                switch (stateProposal) {
                    case (#Adopted) {
                        return #Err("You're trying to vote a Adopted Proposal.")
                    };
                    case (#Executed) {
                        return #Err("You're trying to update a Executed Proposal.")
                    };
                    case (#Rejected) {
                        return #Err("You're trying to update a Rejected Proposal.")
                    };
                    case (#Failed) {
                        return #Err("You're trying to update a Failed Proposal.")
                    };
                    case (#Open) {
                        return #Ok("The proposal is open to vote")
                    }
                }
            }
        }
    };
*/
    

    public func submitProposal(textProposal : Text, principal: Principal, pDATA : ProposalsDATA.Proposals )  :  {
        #Ok : ?PrivateTypes.Proposal;
        #Err : Text
    } {

        if ( valitations(textProposal) == true) {

            let proposal : PrivateTypes.Proposal  = {                    
                        userPrincipal  = principal;
                        title  = textProposal; // Text.extract(textProposal,0,47);
                        description = textProposal;
                        voteCount = 0;
                        state = #Open;
                };
            
            pDATA.setProposals(proposal);

            let pRes : ?PrivateTypes.Proposal =pDATA.getProposals(getProposalsSize());

            switch (pRes) {
                
                case (null) {
                    return #Err("There was an error adding the proposal, please try again")
                };

                case (?propuestaOK) {    
                 
                    return #Ok(pDATA.getProposals(id));
                };
            }
          
        } else {
           return #Err("The proposal did not satisfactorily pass the validations..")
        }

    };

    /*public func getProposal(id : Nat, proposals: HashMap.HashMap<Nat, ProposalTye.Proposal>) : async ?ProposalTye.Proposal {
      
         
          
          
         // let _Proporsals :  HashMap.HashMap<Nat, ProposalTye.Proposal> = ProposalsDATA.Proposals.getProposal;
       
         // let _Proporsals :  ?HashMap.HashMap<Nat, ProposalTye.Proposal> = null;
          // var  test1 : ?ProposalsDATA.Proposals.proposals = null;
          
         //   stable var test2 : ?ProposalsDATA.Proposals= null;
             
          
        
        //      return _Proporsals.getProposals(id);
     
      
    };*/

  /*  public func getAllProposals() : async [(Nat, ProposalTye.Proposal)] {
        let proposalIter : Iter.Iter<(Nat, ProposalTye.Proposal)> = ProposalsData.proposals.entries();
        let proposalArray : [(Nat, ProposalTye.Proposal)] = Iter.toArray(proposalIter);
        return proposalArray
    };
*/

/*
    public func voteProposal(proposal_id : Nat, yes_or_no : Bool) : async {
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
    }*/
}

