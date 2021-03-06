#! /bin/bash

LANGUAGE=objective-c
ARCH=armv7
SYSROOT=/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS6.0.sdk
CLANG_INCLUDE=/usr/lib/clang/4.1/include
PCH_PATH=Calculator-Prefix.pch
FRAMEWORKS=''
OUTPUT='./oclint_output.html'

INCLUDES=''
for folder in `find . -type d`
do
  INCLUDES="$INCLUDES -I $folder"
done

FILES=''
for file in `find . -name "*.m"`
do
  FILES="$FILES $file"
done

oclint -x $LANGUAGE -arch $ARCH -isysroot=$SYSROOT -I $CLANG_INCLUDE $INCLUDES -include $PCH_PATH $FILES
# -html -o $OUTPUT
# open $OUTPUT