## Umlauts and Character Sets

The specific problem with German umlauts is often described as 'dictionary order' or 'phone-book order'.
The Unicode default is okay for the former but if you want `'Ü' = 'UE'`, then you could consider
`utf8mb4_de_pb_0900_ai_ci` or `utf8mb4_german2_ci`, assuming character set is utf8mb4.

## Unknown person

The unknown person has `id` of 1, `fname` and `lname` of `unknown`, `fid` and `mid` of 1,  birth date of `0000-00-00`, `bdorf` of `unknown`.
