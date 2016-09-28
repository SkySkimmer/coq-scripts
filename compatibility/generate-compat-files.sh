#!/bin/bash

function append() {
    SOURCE="$1"
    VERSIONS="$2"
    for v in $VERSIONS; do
	echo >> "Coq__${v}__Compat.v"
	cat "$SOURCE" >> "Coq__${v}__Compat.v"
    done
}

function append_text() {
    TEXT="$1"
    VERSIONS="$2"
    for v in $VERSIONS; do
	echo "$TEXT" >> "Coq__${v}__Compat.v"
    done
}

ALL_VERSIONS="8_4 8_5beta1 8_5beta2 8_5beta3 8_5rc1 8_5 8_5pl1 8_6 trunk"
VECTOR_LIST_VERSIONS="8_4 8_5beta1 8_5beta2 8_5beta3 8_5rc1 8_5 8_5pl1 8_6 trunk"
NPEANO_VERSIONS="8_5beta1 8_5beta2 8_5beta3 8_5rc1 8_5 8_5pl1"
FMAPFACTS_VERSIONS="8_5beta1 8_5beta2 8_5beta3 8_5rc1 8_5 8_5pl1 8_6 trunk"
COQ_MODULE_VERSIONS="8_5beta1 8_5beta2 8_5beta3 8_5rc1 8_5 8_5pl1 8_6 trunk"
FAST_SET_AS_SET_VERSIONS="8_5beta1 8_5beta2 8_5beta3 8_5rc1 8_5 8_5pl1 8_6 trunk"
RELATION_ARGUMENTS_VERSIONS="8_5beta1 8_5beta2 8_5beta3 8_5rc1 8_5"
RAPPLY_SHELVE_VERSIONS="8_5beta1 8_5beta2 8_5beta3"
MISC_BETA1_VERSIONS="8_5beta1 8_5beta2"
INT_VERSIONS="8_5beta2"

for v in $ALL_VERSIONS; do
    cp -f "Coq__${v}__Compat.v.in" "Coq__${v}__Compat.v"
done
append "fragments/FastSetAsSet.v" "$FAST_SET_AS_SET_VERSIONS"
append "fragments/RelationArguments.v" "$RELATION_ARGUMENTS_VERSIONS"
append "fragments/RapplyShelve.v" "$RAPPLY_SHELVE_VERSIONS"
append "fragments/MiscBeta1.v" "$MISC_BETA1_VERSIONS"
append "fragments/VectorListNotations.v" "$VECTOR_LIST_VERSIONS"
append "fragments/NPeanoRequires.v" "$NPEANO_VERSIONS"
append "fragments/FMapFactsRequires.v" "$FMAPFACTS_VERSIONS"
append "fragments/IntRequires.v" "$INT_VERSIONS"
append_text "Module Export Coq." "$COQ_MODULE_VERSIONS"
append "fragments/NPeanoFixes.v" "$NPEANO_VERSIONS"
append "fragments/FMapFactsFixes.v" "$FMAPFACTS_VERSIONS"
append "fragments/IntFixes.v" "$INT_VERSIONS"
append_text "End Coq." "$COQ_MODULE_VERSIONS"