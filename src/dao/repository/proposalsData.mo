import Bool "mo:base/Bool";
import HashMap "mo:base/HashMap";
import Nat "mo:base/Nat";
import ProposalTye "../privateTypes/proposalTye";
import Hash "mo:base/Hash";

actor ProposalsDATA {      
        var proposals = HashMap.HashMap<Nat, ProposalTye.Proposal>(1, Nat.equal, Hash.hash);
        stable var proposalsIdCount : Nat = 0;
};


 /* public func hash(principal : Principal) : async Hash.Hash {
          var  principal : Blob;

          return Blob.hash(Prim.blobOfPrincipal(principal));
    };   */



