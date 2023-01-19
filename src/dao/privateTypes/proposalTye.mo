import StateType "../privateTypes/stateType";

module ProposalType {

    
 type Proposal = {

        userPrincipal : Principal;
        walletID : Text;
        title : Text;
        description : Text;
        voteCount: Int;
        state: StateType.State;
    };

}

