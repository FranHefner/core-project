import Bool "mo:base/Bool";
import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";
import PrivateTypes "../privateTypes/privateTypes";
import Hash "mo:base/Hash";
import Iter "mo:base/Iter";


module ProposalsDATA {         

//  public class Proposals(_ProposalStable: [(Nat, PrivateTypes.Proposal)]) {

  public class Proposals() {
    
        var proposals = HashMap.HashMap<Nat, PrivateTypes.Proposal>(1, Nat.equal, Hash.hash);       
       
        public func getProposals(id : Nat) : ?PrivateTypes.Proposal {

           return proposals.get(id);
        };

        public func setProposals(proposal:PrivateTypes.Proposal)
        {   
            proposals.put(getProposalsSize()+1,proposal);
        };

        public func getProposalsSize() : Nat {
           return proposals.size();
        };

        public func getAllProposals(): [(Nat, PrivateTypes.Proposal)] {
        
          return Iter.toArray<(Nat, PrivateTypes.Proposal)>(proposals.entries());

        }



  
/*
        public func preupgrade() : Proposals {
            return ({
                proposalsStable = Iter.toArray(proposals.entries());
            })
        };

        public func postupgrade(ud : ?Proposals) {
            switch(ud) {
                case(null) {};
                case(? ud) {
                    for((principal, users) in ud.users.vals()){
                        _users.put(principal, users);
                    };
                };
            };
        };        
       };
*/
};
};
