module PrivateType {

    public type Proposal = {
        userPrincipal : Principal;
        title : Text;
        description : Text;
        voteCount : Int;
        state : State
    };

    public type State = {
        #Adopted;
        #Executed;
        #Rejected;
        #Open;
        #Failed
    };

}
