#!/bin/bash

info() { printf "\033[1;31m\n   %s\033[0;33m$@\n\n";  }
error() { printf "\033[1;31m • $@\033[0;0m\n"; }
passed() { printf "\033[0;32m • $@\033[0;0m\n"; }

FAILED=""

#
# /KTH_NODEJS should contain a pattern or show infor
#
# Usage: expectToContain "Build date" "No build date pressent in /KTH_NODEJS"
#
expectToContain() {
    FILE=$(cat /$1)
    PATTERN="$2"
    FAILURE_INFO="$3"
    
    if [[ "$FILE" == *"$PATTERN"* ]]; then
        if [ ! -z "$FAILURE_INFO" ]; then
            passed "$FAILURE_INFO."
        else 
            passed "/KTH_NODEJS contains $PATTERN"
        fi
 
    else
        if [ ! -z "$FAILURE_INFO" ]; then
            error "$FAILURE_INFO"
        fi
        info "/KTH_NODEJS does not contain pattern '$PATTERN'."
        
        FAILED="true"
    fi

}

# ---------------- Tests ----------------

echo ""
echo "OS"
expectToContain "/KTH_OS" "Build date:" "/KTH_OS should contain the date when the images was built."
expectToContain "/KTH_OS" "Alpine version: 3" "/KTH_OS should contain the Alpine version."

echo ""
echo "Node JS"
expectToContain "/KTH_NODEJS" "Build date:" "/KTH_NODEJS should contain the date when the images was built."
expectToContain "/KTH_NODEJS" "Node: v16" "Image should have Node v16* installed."
expectToContain "/KTH_NODEJS" "NPM: 7" "Image should have 'npm 7.*.*' installed."
expectToContain "/KTH_NODEJS" "Yarn: 1." "Image should have 'Yarn 1.*.*' installed."
expectToContain "/KTH_NODEJS" "merge-descriptors@" "Image should have global package 'merge-descriptors' installed."

# Result
if [[ "$FAILED" != *"true"* ]]; then
    info "All end-to-end tests passed."
    exit 0
else
    echo ""
    exit 1
fi







