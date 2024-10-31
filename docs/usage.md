# nds-lucid/ingestion: Usage

## Table of contents

- [nds-lucid/ingestion: Usage](#nds-lucidingestion-usage)
  - [Table of contents](#table-of-contents)
  - [Introduction](#introduction)
  - [Running the pipeline](#running-the-pipeline)
    - [Updating the pipeline](#updating-the-pipeline)
    - [Profiles](#profiles)
    - [Reproducibility](#reproducibility)
    - [Main arguments](#main-arguments)

## Introduction

As the pipeline lives in a repository from GitHub, you have to options to run the pipeline:
1)  Clone the repository, move inside of it and run the pipeline with `nextflow run main.nf [OPTIONS]`
2)  Configure the SCM file for the GitHub with your credentials. See [Nextflow's documentation for pipeline sharing](https://www.nextflow.io/docs/latest/sharing.html#private-server-configuration) for more information.

## Running the pipeline

The typical command for running the pipeline is as follows:

Option 1 (see above):
```bash
nextflow run main.nf
```
Option 2 (see above):
```bash
nextflow run nds-lucid-ingestion
```

### Updating the pipeline

When you run option 2 of the above command, Nextflow automatically pulls the pipeline code from GitHub and stores it as a cached version. When running the pipeline after this, it will always use the cached version if available - even if the pipeline has been updated since. To make sure that you're running the latest version of the pipeline, make sure that you regularly update the cached version of the pipeline:

```bash
nextflow pull nds-lucid-ingestion
```

### Profiles

There are three profiles available:

  1. `standard` to run the pipeline outside of the BioMedIT space (will use public container images)
  2. `test` to run the pipeline using synthetic test data
  3. `biomedit` to run the pipeline inside of the BioMedIT space (make sure to set the appropriate container images)

### Reproducibility

It is a good idea to specify a pipeline version when running the pipeline on your data. This ensures that a specific version of the pipeline code and software are used when you run your pipeline. If you keep using the same tag, you'll be running the same version of the pipeline, even if there have been changes to the code since.

First, go to the [nds-lucid-ingestion tags page](https://github.com/sdsc-ordes/nds-lucid-ingestion/tags) and find the latest pipeline version - numeric only (eg. `1.3.1`). Then specify this when running the pipeline with `-r` (one hyphen) - eg. `-r 1.3.1`. Of course, you can switch to another version by changing the number after the `-r` flag.

This version number will be logged in reports when you run the pipeline, so that you'll know what you used when you look back in the future. For example, at the bottom of the MultiQC reports.

### Main arguments

The pipeline uses the following arguments:

* `--input_dir` - Path to the directory containing input `zip` packages.
* `--output_dir` - Path to the output directory where all valid files will be grouped, compressed and copied.
* `--notification_dir` - Path to the directory where all notification files will be landing.
* `--shapes` - Path to file with SHACL shapes.
* `--ontology` - Path to file with RDF schema.
* `--terminology_folder` - Path to folder with all external terminologies in turtle (`.ttl`) format.
* `--input_rdf_ext` - Expected extension for the RDF files in the landing `zip` package.
* `--decrypt` - Do we need to decrypt data with `sett-rs`?
* `--rerun` - Should the pipeline run on already available data?
* `--buffer_size` - Number of files bundled and validated at once.