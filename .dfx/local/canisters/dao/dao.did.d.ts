import type { Principal } from '@dfinity/principal';
import type { ActorMethod } from '@dfinity/agent';

export interface Proposal {
  'title' : string,
  'voteCount' : bigint,
  'description' : string,
  'state' : State,
  'userPrincipal' : Principal,
}
export type State = { 'Failed' : null } |
  { 'Open' : null } |
  { 'Rejected' : null } |
  { 'Executed' : null } |
  { 'Adopted' : null };
export interface _SERVICE {
  'get_proposal' : ActorMethod<[bigint], [] | [Proposal]>,
  'submit_proposal' : ActorMethod<
    [string],
    { 'Ok' : [] | [Proposal] } |
      { 'Err' : string }
  >,
}
