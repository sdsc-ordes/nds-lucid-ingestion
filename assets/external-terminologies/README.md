# External terminologies

This folder should include all the external terminologies necessary for your data to be validated in `ttl` format. If you're using another rdf file format, you can set the `input_rdf_ext` parameter in the `nextflow.config` file.  
In the case of LUCID, we require the following terminologies:
  - [EUVOC currency](https://op.europa.eu/en/web/eu-vocabularies/dataset/-/resource?uri=http://publications.europa.eu/resource/dataset/euvoc&version=2.0)
  - [SNOMED-CT (Swiss extension)](https://sphn-semantic-framework.readthedocs.io/en/latest/external_terminologies/external_terminologies.html#snomed-ct)
  - [SPHN ATC](https://sphn-semantic-framework.readthedocs.io/en/latest/external_terminologies/external_terminologies.html#atc)
  - [SPHN CHOP](https://sphn-semantic-framework.readthedocs.io/en/latest/external_terminologies/external_terminologies.html#chop)
  - [SPHN ICD-10](https://sphn-semantic-framework.readthedocs.io/en/latest/external_terminologies/external_terminologies.html#icd-10-gm)
  - [SPHN LOINC](https://sphn-semantic-framework.readthedocs.io/en/latest/external_terminologies/external_terminologies.html#loinc)
  - [SPHN UCUM](https://sphn-semantic-framework.readthedocs.io/en/latest/external_terminologies/external_terminologies.html#ucum)

Most of these are available from the [DCC Terminology Service](https://terminology.dcc.sib.swiss/). Find more information about this service in the [SPHN documentation](https://sphn-semantic-framework.readthedocs.io/en/latest/sphn_framework/terminology_service.html#terminology-service).