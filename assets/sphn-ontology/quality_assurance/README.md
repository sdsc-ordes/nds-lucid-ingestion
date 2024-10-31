# Quality assurance

Within this directory you will find utilities such as shacl rules and SPARQL queries aimed at facilitating the validation of data in compliance with the SPHN RDF Schema or a SPHN project-specific schema.

__SHACL rules__

The shacl rules are used for validating datasets following the SPHN RDF Schema and allow to check for the following constraints:
Note on the formatting: the level of the validation constraint is in the straight brackets before each constraint type. 

- [ERROR] no other properties used for this class than the specified in the RDF schema with inference rules applied (same as displayed in the pyLODE visualization)
- [ERROR] the properties occur the right cardinality :
- [ERROR] the properties lead to the right target type (datatype or class)
- [ERROR] when terminology valuesets are used, the specification whether children/descendands (direct and indirect subclasses) are allowed is checked
- [ERROR] when terminology valuesets are used, the validity of the codes are checked according the restricted valuesets
- [ERROR] when specifiying start and end datetimes in a class, it is asserted that the start is before the end datetime 

For SPHN/project valuesets in the RDF Schema:

- [ERROR] no other than the specified individuals of the valueset are used 

In general:

- [WARN] naming conventions are obeyed for instances of project/SPHN classes 
- [WARN] naming conventions are obeyed for instances of shared resources e.g. external terminologies 

For historized terminologies (e.g. ATC, CHOP, ICD-10-GM):

- [INFO] an old versioned code is used, this code has been valid in the version specified but is not valid in the current version 
- [INFO] an old versioned code is used, this code is still valid in the current version 
- [WARN] an unversioned code is used, this code is known to have changed its meaning according to the historization 


__SPARQL queries__

With the set of statistical SPARQL queries it is possible to gain important information about a dataset such as:
* The list of resources defined for a
concept together with the direct
property values
* Counting instances per concept
and predicates
* Minimum and maximum
values/dates per predicate
* List and count of all used codes
for hasCode
