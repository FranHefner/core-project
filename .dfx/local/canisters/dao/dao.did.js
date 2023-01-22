export const idlFactory = ({ IDL }) => {
  const State = IDL.Variant({
    'Failed' : IDL.Null,
    'Open' : IDL.Null,
    'Rejected' : IDL.Null,
    'Executed' : IDL.Null,
    'Adopted' : IDL.Null,
  });
  const Proposal = IDL.Record({
    'title' : IDL.Text,
    'voteCount' : IDL.Int,
    'description' : IDL.Text,
    'state' : State,
    'userPrincipal' : IDL.Principal,
  });
  return IDL.Service({
    'get_proposal' : IDL.Func([IDL.Nat], [IDL.Opt(Proposal)], []),
    'submit_proposal' : IDL.Func(
        [IDL.Text],
        [IDL.Variant({ 'Ok' : IDL.Opt(Proposal), 'Err' : IDL.Text })],
        [],
      ),
  });
};
export const init = ({ IDL }) => { return []; };
