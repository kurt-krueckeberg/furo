## UJmlauts and Character Sets

The specific problem with German umlauts is often described as 'dictionary order' or 'phone-book order'.
The Unicode default is okay for the former but if you want `'Ü' = 'UE'`, then you could consider
`utf8mb4_de_pb_0900_ai_ci` or `utf8mb4_german2_ci`, assuming character set is utf8mb4.

## Unknown person

The unknown person has `id` of 1, and `fid` and `mid`,  badte of `0000-00-00`, `bdorf` of `unknown`.

## Citations for events

If citations can apply to more than one event, we would use this table and remove `event(cite`) foreign reference from the event table, and use this 
table instead to link citations to events. It is also neeed if a citation can apply to more than one event.

```sql
 create table if not exists cite_events (
  cid int not null,
  eid int not null,
  primary key (cid, eid),
  foreign key cid reference cite(id),
  foreign key eid reference event(id)
);
```

pid is the person id.  Does a marriage creates two events to be created, one for each spouse. We can solve this
with a person_events table?
How does GedcomX handle this?

The married couple, husband and wife, constitute a 'family', even if they neve have children.
pid is person(id).  bapid is the baptism event id.

fid is family id.
