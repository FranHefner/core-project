import Bool "mo:base/Bool";
import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";
import ProposalTye "../privateTypes/proposalTye";
import Hash "mo:base/Hash";

module ProposalsDATA {    


     public class Proposals(){

            var proposals = HashMap.HashMap<Nat, ProposalTye.Proposal>(1, Nat.equal, Hash.hash);
            var proposalsIdCount : Nat = 0;

            
          public func getProposals(id : Nat):async ?ProposalTye.Proposal {

              return proposals.get(id);
         }
        
       };

    public func getProposals(id : Nat):async ?ProposalTye.Proposal {

        return proposals.get(id);
    }



      
     
};



