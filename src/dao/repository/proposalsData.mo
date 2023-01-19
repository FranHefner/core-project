import Bool "mo:base/Bool";


actor {

    
    var proposals = HashMap.HashMap<Nat, Proposal>(1, Nat.equal, Hash.hash);

    stable var proposalsIdCount : Nat = 0;

    public func hash(principal : Principal) : async Hash.Hash {
          var  principal : Blob;

          return Blob.hash(Prim.blobOfPrincipal(principal));
    };   

        

}