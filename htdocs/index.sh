#!/bin/sh

echo "Content-type: application/json; charset=utf-8"
echo ""
echo "{\"date\": \"$(date)\", \"street\": \"$(echo $MUELL_STREET)\"}"