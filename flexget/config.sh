#!/bin/bash
CONFIG="/config"
CONTENT="/content"
DOWNLOADS="/downloads"

if [[ ! -f $CONFIG/settings.json ]]; then
  echo "Creating default settings for Transmission"
  cp /tmp/settings.json $CONFIG/
  
  if [[ -n ${USERNAME} ]]; then
    echo "The username is: ${USERNAME}"
    sed -i -e "s#\(.*\"rpc-username\":\).*#\1 \"${USERNAME}\",#g" $CONFIG/settings.json
  fi

  if [[ -n ${PASSWORD} ]]; then
    echo "The password is: ${PASSWORD}"
    sed -i -e "s#\(.*\"rpc-password\":\).*#\1 \"${PASSWORD}\",#g" $CONFIG/settings.json
  fi
fi

# Make sure the download folders exist
if [[ ! -f $DOWNLOADS/tv ]]; then
  echo "Creating folder for TV shows in ${DOWNLOADS}"
  mkdir $DOWNLOADS/tv
fi

if [[ ! -f $DOWNLOADS/movies ]]; then
  echo "Creating folder for movies in ${DOWNLOADS}"
  mkdir $DOWNLOADS/movies
fi

if [[ ! -f $DOWNLOADS/audio ]]; then
  echo "Creating folder for audio in ${DOWNLOADS}"
  mkdir $DOWNLOADS/audio
fi

if [[ ! -f $DOWNLOADS/other ]]; then
  echo "Creating folder for other content in ${DOWNLOADS}"
  mkdir $DOWNLOADS/other
fi

# Make sure we have folders for long term storage
if [[ ! -f $CONTENT/tv ]]; then
  echo "Creating folder for TV shows in ${CONTENT}"
  mkdir $CONTENT/tv
fi

if [[ ! -f $CONTENT/movies ]]; then
  echo "Creating folder for movies in ${CONTENT}"
  mkdir $CONTENT/movies
fi

if [[ ! -f $CONTENT/audio ]]; then
  echo "Creating folder for audio in ${CONTENT}"
  mkdir $CONTENT/audio
fi

if [[ ! -f $CONTENT/other ]]; then
  echo "Creating folder for other content in ${CONTENT}"
  mkdir $CONTENT/other
fi

