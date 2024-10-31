# SPHN RDF Schema

The SPHN RDF Schema is available both as Turtle (.ttl) and OWL/XML(.owl) files.

## Change notes

### 03.05.2024

Bug fix for the SPHN RDF Schema 2024.2 contains the following changes compared to the previous version:

* Fixed cardinality of `hasOutput` property for `Sample Processing`
* Fixed cardinality of `hasNotation` property for `Variant Descriptor`


### 01.02.2024

New SPHN RDF Schema 2024.2 release contains the following changes compared to the previous version:

* Fixed a bug where the ICD-10-GM root nodes were not added as a restriction to `Billed Diagnosis`, `Oncology Diagnosis`, and `Death`
* Updated the general description of `hasRelativeTemporalityCode` property
* Updated cardinalities for `Assessment Event`, `Assessment`, `Variant Descriptor` and `Gene Panel`


### 16.01.2024

New SPHN RDF Schema 2024.1 release contains the following major changes compared to the previous version:

* Change of the base IRI for the schema from `https://www.biomedit.ch/rdf/sphn-ontology/sphn/` to `https://www.biomedit.ch/rdf/sphn-schema/sphn/`
* To avoid conflicts with naming, change of base IRI for named individual from `https://biomedit.ch/rdf/sphn-ontology/sphn#` to `https://biomedit.ch/rdf/sphn-schema/sphn/individual#`
* Adoption of a [knowledge-centric design](https://sphn-semantic-framework.readthedocs.io/en/latest/sphn_framework/sphndataset.html#knowledge-centric-design) which led to reorganization of several concepts
* Redesign of Measurement concepts and introduction of new concepts for representing Time Series data
* Redesign of Laboratory and Microbiology concepts
* Addition of Omics concepts like `Assay`, `Sample Processing`, `Data Processing`
* Addition of Provenance concepts to represent provenance data
* Addition of Assessment concepts
* Introduction of `hasSharedIdentifier` datatype property to `Sample` and `SubjectPseudoIdentifier` concepts
* Addition of `SPHNConcept` to the domain of all object properties
* `DataProviderInstitute` concept changed to `DataProvider`. Consequently, `hasDataProviderInstitute` object property changed to `hasDataProvider`
* Properties that are likely to be sensitive and subject to de-identification are annotated with `subjectToDeIdentification` annotation property


A detailed list of all changes is accessible in the migration path Excel file.


### 20.03.2023

New SPHN RDF Schema 2023.2 release contains the following major changes compared to the previous version:

* Change in the interpretation of “standards or other” from the standards column (SPHN Dataset) in the RDF schema: other is now always interpreted as “Terminology or Code”
* Oxygen Saturation hasBodySite property: restriction removed, note added to inform about recommended values
* When having mixed valuesets (descendants enabled in one value, not in the other), the tool currently interprets as descendants allowed in all values
* Fix parents of some classes (FOPH Procedure Code, Respiratory Rate) .

A detailed list of all changes is accessible in the migration path Excel file.

### 07.03.2023

New SPHN RDF Schema 2023.1 release contrains the following changes compared to the previous version:

* For the first time the SPHN RDF Schema has been automatically generated using the [dataset2rdf tool](https://git.dcc.sib.swiss/sphn-semantic-framework/dataset2rdf).
* Note that starting from the 2023.1 release, concept cardinalities will be represented directly in the SPHN Dataset.
* Cardinalities of `hasCode` connected to `Allergen`, `Diagnosis` and `Procedure` have been changed from 1:1 to 1:n (to allow multi-code).
* Cardinalities of `hasSubjectPseudoIdentifier` connected to `AdministrativeGender` and `CivilStatus` has been changed from 1:n to 1:1.
* Cardinalities of `hasAdministrativeCase` connect to all other concept has been changed from 1:1 or 1:n to 0:1 to 0:n (to allow representation from data outside the hospitals e.g. cohorts).
* Replace `skos:definition` with `skos:scopeNote` to encode information whether a children value is possible to use for a property value
* Added `skos:definition` to represent concept and property descriptions, in addition to `skos:comment` (the latter will be phased out in future releases)
* Merged `Quantity_comparator` and `BirthDate_comparator` into a single class `Comparator`
* Removed `Equal` as a possible value for `Comparator`

A detailed list of changes with exact modification, addition and removal of elements are summarized in the migration path Excel file showing the differences between the SPHN RDF Schema 2023.1 and 2022.2.


### 20.07.2022

New SPHN RDF Schema 2022.2 release contains the following changes compared to the previous version:

* Property `hasScore` is removed (it was an artefact from 2021.2, not used in 2022 versions)
* Missing `hasIntent` cardinality restriction has been added to `RadiotherapyProcedure` 
* Restriction of the property `hasTypeCode` for `MedicalDevice` is fixed
* IRI `hasQuantitativeResultCode` changed to `hasQualitativeResultCode`
* Cardinality of `hasAdministrativeCase` connected to `ProblemCondition` has been changed from 1:1 to 0:1 (after request from one hospital: data not available)
* Property links and cardinalities of `hasAdministrativeCase`, `hasSubjectPseudoIdentifier` and `hasDataProviderInstitute` have been removed from `LabTest` (since it is a concept necessarily reused in `LabResult`)
* Updated CHOP version to 2022.4 (which contains Codes without the Z prefix letter)


### 30.05.2022

New SPHN RDF Schema 2022.1 release contains the following global changes: 

* Simplification of property naming: convention is to use `has + <dataset general name>` 
* Use of `owl:restriction` for encoding property value restrictions and cardinalities. Ranges do not always represent the list of allowed values.
* Added new concepts and composedOf from the SPHN Dataset 2022.1
* Created a `Deprecated` class listed the deprecated classes from 2021.2
* Added `skos:definition` to encode information whether a children value is possible to use for a property value
* Added `skos:note` to encode information about allowed coding systems (external terminologies) for a property value and to encode information about recommended values for a property value.
* Inheritance rule are updated: by default, all properties of a parent class are inherited by the child class and therefore the children classes are not explicitely written as domain of that property.

A detailed list of changes with exact modification, addition and removal of elements are summarized in the migration path Excel file showing the differences between the SPHN RDF Schema 2021.2 and 2022.1.

### 03.09.2021

New SPHN RDF Schema 2021.2 release contains the following changes:

* Changed version IRI: __owl:versionIRI <https://biomedit.ch/rdf/sphn-ontology/sphn/2021/1>__ to __owl:versionIRI <https://biomedit.ch/rdf/sphn-ontology/sphn/2021/2>__
* Fixed typos:
    * changed object property IRI __hasSimpleScorescoringSystemCode__ to __hasSimpleScoreScoringSystemCode__
    * changed individual IRI __PAXgeneBloodBNA__ to __PAXgeneBloodDNA__
* Fixed range of hasDrugPrescriptionIndicationToStart: DrugPrescription_indicationToStart __or__ FOPHDiagnosis
* Fixed individual IRI: __PAXgeneBloodRNA+__ to __PAXgeneBloodRNAplus__
* Fixed IRIs of individuals that started with lower case letter (for consistency):
    * __complementary__ to __Complementary__
    * __death__ to __Death__
    * __principal__ to __Principal__
    * __secondary__ to __Secondary__
    * __supplementary__ to __Supplementary__
    * Deleted IRI __unknown__, added __unknown__ types to the individual __Unknown__, added a __skos:altLabel unknown__ to individual __Unknown__.
* Fixed IRIs of individuals that contained dots ('.'):
    * __PPTube0.5to2mL__ to __PPTube0dot5to2mL__
    * __RECIST1.0__ to __RECIST1dot0__
    * __RECIST1.1__ to __RECIST1dot1__
* The references of the modified individuals in the ValueSet classes have also been updated accordingly
* Changed data property IRI __hasExtractionDate__ to __hasExtractionDateTime__
* Added HealthcareEncounter to the domain of hasAdministrativeCase
* Added an rdfs:comment to Class __Measurement__
* Fixed prefixes:
    * Prefix __atc__ now refers to namespace __https://www.whocc.no/atc_ddd_index/?code=__
    * Prefix __loinc__ now refers to namespace __https://loinc.org/rdf/__
    * Prefix __sphn-atc__ refers to namespace __https://biomedit.ch/rdf/sphn-resource/atc/__
    * Prefix __sphn-loinc__ refers to namespace __https://biomedit.ch/rdf/sphn-resource/loinc/__



### 02.06.2021

New updates on the SPHN ontology 2021.1 release:

* Fixed typo in __https://biomedit.ch/rdf/sphn-ontology/sphn/SustanceAmount__ changed to __https://biomedit.ch/rdf/sphn-ontology/sphn/SubstanceAmount__
* Fixed meaning binding of __Body temperature (https://loinc.org/rdf/8310-5)__ from __Body temperature (observable entity) (http://snomed.info/id/386725007)__ to __Body Temperature https://biomedit.ch/rdf/sphn-ontology/BodyTemperature__
* Added Range to hasMeasuredValue: __xsd:double__
* Updated description of hasMeasuredValue
* Added Range to hasDiagnosticExaminationUnit: __Unit__
