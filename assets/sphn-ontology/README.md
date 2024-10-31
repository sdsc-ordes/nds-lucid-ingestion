# SPHN Semantic Interoperability Framework

The SPHN Semantic Interoperability Framework project contains the SPHN Dataset and the SPHN RDF Schema with related content such as SHACL rules, SPARQL queries and templates.


## SPHN RDF Schema

The schema is derived from the [SPHN Dataset](https://sphn.ch/document/sphn-dataset/) accessible on the [dataset](dataset) folder.
The schema is provided in Turtle (.ttl) and in OWL/XML (.owl) formats in the [rdf_schema](rdf_schema) folder. This RDF schema does include links to other external ontologies such as SNOMED CT. These external terminologies in RDF are accessible via the Terminology service in the [BioMedIT Portal](https://portal.dcc.sib.swiss/).

The SPHN RDF schema is also available directly on the web at:
* https://www.biomedit.ch/rdf/sphn-schema/sphn/2024/2 (2024.2)
* https://www.biomedit.ch/rdf/sphn-schema/sphn/2024/1 (2024.1)
* https://www.biomedit.ch/rdf/sphn-ontology/sphn/2023/2 (2023.2)
* https://www.biomedit.ch/rdf/sphn-ontology/sphn/2023/1 (2023.1)
* https://www.biomedit.ch/rdf/sphn-ontology/sphn/2022/2 (2022.2) 
* https://www.biomedit.ch/rdf/sphn-ontology/sphn/2022/1 (2022.1)
* https://www.biomedit.ch/rdf/sphn-ontology/sphn/2021/2 (2021.2)

The graphs can be also interactivly browsed with [SPHN Schema Scope](https://schemascope.dcc.sib.swiss/).

## Official releases

* [2024.2 release](https://git.dcc.sib.swiss/sphn-semantic-framework/sphn-ontology/-/tags/2024-2) (latest release)
* [2024.1 release](https://git.dcc.sib.swiss/sphn-semantic-framework/sphn-ontology/-/tags/2024-1)
* [2023.2 release](https://git.dcc.sib.swiss/sphn-semantic-framework/sphn-ontology/-/tags/2023-2)
* [2023.1 release](https://git.dcc.sib.swiss/sphn-semantic-framework/sphn-ontology/-/tags/2023-1) 
* [2022.2 release](https://git.dcc.sib.swiss/sphn-semantic-framework/sphn-ontology/-/tags/2022-2)
* [2022.1 release](https://git.dcc.sib.swiss/sphn-semantic-framework/sphn-ontology/-/tags/2022-1)
* [2021.2 release](https://git.dcc.sib.swiss/sphn-semantic-framework/sphn-ontology/-/tags/2021-2)
* [2021.1 release](https://git.dcc.sib.swiss/sphn-semantic-framework/sphn-ontology/-/tags/2021-1)

## Documentation

General documentation can be found at: [sphn-semantic-framework.readthedocs.io](https://sphn-semantic-framework.readthedocs.io/en/latest/index.html)


## License and Copyright

© Copyright 2024, Personalized Health Informatics Group (PHI), SIB Swiss Institute of Bioinformatics

The SPHN RDF Schema is licensed under the [CC BY 4.0](https://creativecommons.org/licenses/by/4.0/) (see [License](LICENSE)).


This material contains content from:
* __ATC__  (https://www.whocc.no/atc_ddd_index/) The copyright follows the instructions provided by WHO regarding ATC (https://www.whocc.no/copyright_disclaimer/): “Use of all or parts of the material requires reference to the WHO Collaborating Centre for Drug Statistics Methodology. Copying and distribution for commercial purposes is not allowed. Changing or manipulating the material is not allowed.”
* __CHOP__ (https://www.bfs.admin.ch/bfs/de/home/statistiken/kataloge-datenbanken/publikationen.assetdetail.13772937.html) © BFS - 2022, Bundesamt für Statistik, Medizinische Klassifikation, Switzerland
* __GENO__ (http://obofoundry.org/ontology/geno). GENO is an open-source ontology, implemented in OWL2 under the CC BY 4.0  License. (https://github.com/monarch-initiative/GENO-ontology/).
* __GA4GH Phenopackets__ (https://phenopacket-schema.readthedocs.io/en/v2/index.html), © Copyright Global Alliance for Genomics and Health Revision 2400ab5f.
* __HGNC__ (http://genenames.org) The copyright follows the instructions provided by the EMBL-EBI, Wellcome Genome Campus, Hinxton, CB10 1SD. For more details on the usage rights, please consult the EMBL-EBI terms of use (https://www.ebi.ac.uk/about/terms-of-use).
* __ICD-10-GM__ (https://www.dimdi.de/dynamic/de/klassifikationen/icd/) The ICD-10-GM RDF file has been produced using the ICD-10-GM machine-readable version of the German Institute of Medical Documentation and Information (DIMDI) which belongs to the BfArM and is available on the Website www.dimdi.de. Download conditions and terms of use published by the BfArM apply ([available on BfArM website](https://www.bfarm.de/EN/Code-systems/Classifications/ICD/ICD-10-GM/_node.html)).
* __LOINC__ (http://loinc.org). LOINC is copyright © 1995-2022, Regenstrief Institute, Inc. and the Logical Observation Identifiers Names and Codes (LOINC) Committee and is available at no cost under the license at http://loinc.org/license. LOINC® is a registered United States trademark of Regenstrief Institute, Inc.
* __SNOMED CT__ (https://www.snomed.org/), SNOMED CT is copyright © SNOMED International 2022, SNOMED CT international. In order to use the file please register with eHealth Suisse for an affiliate license for SNOMED CT (free) https://www.e-health-suisse.ch/technik-semantik/semantische-interoperabilitaet/snomed-ct/registration-und-lizenz.html. Note: for compliance purposes, whoever distributes the SNOMED CT RDF received through the Terminology Service must keep a record of users using it.
* __SO__ (http://www.sequenceontology.org/). Sequence Ontology data and data products are licensed under the Creative Commons Attribution 4.0 Unported License (http://www.sequenceontology.org/?page_id=345).
* __UCUM__ (https://ucum.org/trac) The copyright follows the instructions provided by Regenstrief Institute. UCUM is Copyright © 1999-2013 Regenstrief Institute, Inc. and The UCUM Organization, Indianapolis, IN. All rights reserved. See [Copyright Notice and License](https://ucum.org/trac/wiki/license), in particular the Disclaimer of Warranty (Section 7).

The 2024.2 release will additionally include content from:
* __ECO__ (https://www.evidenceontology.org)
* __EDAM__ (https://edamontology.org/)
* __EFO__ (https://www.ebi.ac.uk/efo/)
* __GenEpiO__ (https://genepio.org)
* __OBI__ (https://obi-ontology.org)
* __ORPHA__ (https://www.orphadata.com)


## Citing us

- Österle, S.; Touré, V.; Crameri, K. (2021), The SPHN Ecosystem Towards FAIR Data.
Preprints, 2021090505 (doi: [10.20944/preprints202109.0505.v1](https://www.preprints.org/manuscript/202109.0505/v1))

- Gaudet-Blavignac C, Raisaro JL, Touré V, Österle S, Crameri K, Lovis C (2021),
A National, Semantic-Driven, Three-Pillar Strategy to Enable Health Data Secondary Usage 
Interoperability for Research Within the Swiss Personalized Health Network, 
JMIR Med Inform 9 (6), e27591 (doi: [10.2196/27591](https://medinform.jmir.org/2021/6/e27591))

- Touré, V., Krauss, P., Gnodtke, K., Buchhorn, J., Unni, D., Horki, P., Raisaro, J.L., Kalt, K.,
Teixeira, D., Crameri, K. and Österle, S. (2023), 
FAIRification of health-related data using semantic web technologies in the Swiss Personalized Health Network. 
Scientific Data, 10(1), p.127 (doi: [10.1038/s41597-023-02028-y](https://doi.org/10.1038/s41597-023-02028-y>))

## Contact

For any question or comment, please contact the Data Coordination Center at [dcc@sib.swiss](mailto:dcc@sib.swiss).
