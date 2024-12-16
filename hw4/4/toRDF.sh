#!/bin/bash

rdf serialize --input-format tabular --output-format turtle --minimal --decode-uri \
    --prefixes ex:http://example.org/,seasto:https://w3id.org/seas/,dpv:https://w3c.github.io/dpv/2.0/,iol:http://www.ontologydesignpatterns.org/ont/dul/IOLite.owl#,km4c:http://www.disit.org/km4city/schema#,uiot:http://www.w3id.org/urban-iot/core#,oo:http://purl.org/openorg/ \
    csv/data.csv-metadata.json > rdf/data.ttl
