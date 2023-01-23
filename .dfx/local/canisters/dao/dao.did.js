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
    'voteCount' : IDL.Nat,
    'description' : IDL.Text,
    'state' : State,
    'userPrincipal' : IDL.Principal,
  });
  return IDL.Service({
    'get_all_proposals' : IDL.Func(
        [],
        [IDL.Vec(IDL.Tuple(IDL.Nat, Proposal))],
        ['query'],
      ),
    'get_proposal' : IDL.Func([IDL.Nat], [IDL.Opt(Proposal)], ['query']),
    'submit_proposal' : IDL.Func(
        [IDL.Text],
        [IDL.Variant({ 'Ok' : IDL.Opt(Proposal), 'Err' : IDL.Text })],
        [],
      ),
    'vote' : IDL.Func(
        [IDL.Nat, IDL.Bool],
        [IDL.Variant({ 'Ok' : IDL.Tuple(IDL.Nat, IDL.Nat), 'Err' : IDL.Text })],
        [],
      ),
  });
};
export const init = ({ IDL }) => { return []; };
