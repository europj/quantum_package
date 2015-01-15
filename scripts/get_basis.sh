#!/bin/bash
#
# get_basis.sh <basis_name> <atom_list>
#
# Uses the EMSL_api.py to get the basis set: 
#  https://github.com/TApplencourt/EMSL_Basis_Set_Exchange_Local
#
# Prints in stdout the name of a temporary file containing the basis set.
#

export EMSL_API_ROOT="${QPACKAGE_ROOT}"/EMSL_Basis/
export PYTHONPATH="${EMSL_API_ROOT}":${PYTHONPATH}

basis="$1"
shift
atoms=""

for atom in $@
do
  atoms+="--atom ${atom} "
done

tmpfile=$(tempfile)
if [[ $? -ne 0 ]]
then
  echo "==================================================" 1>& 2
  echo "Unable to create temporary file $tmpfile" 1>& 2
  echo "==================================================" 1>& 2
  echo "ERROR"
  exit 1
fi
${EMSL_API_ROOT}/EMSL_api.py get_basis_data --save --path="${tmpfile}" --basis="${basis}" $atoms




