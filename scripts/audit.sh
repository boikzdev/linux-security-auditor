#!/bin/bash

VERSION="1.0"
OUTPUT="audit_results.json"
VERBOSE=false

BASE_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

run_module(){

    echo "[+] Running $1"

    bash "$BASE_DIR/scripts/$1" \
    >> "$BASE_DIR/$OUTPUT"

}


while [[ $# -gt 0 ]]; do

case $1 in

--config)
MODULE="config_audit.sh"
;;

--logs)
MODULE="log_analysis.sh"
;;

--ports)
MODULE="port_scanner.sh"
;;

--users)
MODULE="config_audit.sh"
;;

--all)
MODULE="all"
;;

-v)
VERBOSE=true
;;

--output)
OUTPUT=$2
shift
;;

esac

shift

done


echo "{ " > $OUTPUT


if [[ "$MODULE" == "all" || -z "$MODULE" ]]; then

echo '"configuration":' >> $OUTPUT
bash scripts/config_audit.sh >> $OUTPUT

echo "," >> $OUTPUT

echo '"logs":' >> $OUTPUT
bash scripts/log_analysis.sh >> $OUTPUT

echo "," >> $OUTPUT

echo '"ports":' >> $OUTPUT
bash scripts/port_scanner.sh >> $OUTPUT


else

bash scripts/$MODULE >> $OUTPUT


fi


echo "}" >> $OUTPUT


echo "[+] Audit completed"
echo "[+] Results saved: $OUTPUT"
