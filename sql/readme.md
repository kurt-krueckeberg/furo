## Umlauts and Character Sets

The specific problem with German umlauts is often described as 'dictionary order' or 'phone-book order'.
The Unicode default is okay for the former but if you want `'Ü' = 'UE'`, then you could consider
`utf8mb4_de_pb_0900_ai_ci` or `utf8mb4_german2_ci`, assuming character set is utf8mb4.

## Unknown person

The `person(id)` of **1** is used to designate any as yet unknown individual, none of whose attibutes are have meanful values.
The `fname` and `lname` are `unknown`, the `fid` and `mid` is `1`,  birth date is `0000-00-00`, and `bdorf` is `unknown`.
