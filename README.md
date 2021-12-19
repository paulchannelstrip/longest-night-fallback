## Usage

To change the caption, edit the `caption.txt` file. Be sure to leave an empty line at the beginning, as
ffmpeg will append a \r to the end (for some reason).

To change the stream endpoint, edit the last line of `startstream.sh`.

All resources necessary are in this repository. Changing to our needs should be self-explanatory. Have fun!

## Day-of

Copy `startstream.sh` to a new file `start-prod.sh`, and replace the testing/development RTMP endpoint with the endpoint of your final stream.
***DO NOT COMMIT YOUR STREAM KEYS TO GIT, ESPECIALLY NOT PUBLIC REPOSITORIES.***

