import StateType "../privateTypes/stateType";

module ProposalType {

    
 type Proposal = {

        userPrincipal : Principal;        
        title : Text;
        description : Text;
        voteCount: Int;
        state: StateType.State;
    };

}

