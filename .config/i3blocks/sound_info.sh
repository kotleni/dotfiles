#!/usr/bin/env bash

#!/usr/bin/env bash

VOLUME_MUTE="MUTE"
VOLUME_LOW="."
VOLUME_MID=".."
VOLUME_HIGH="..."

OUTPUT=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)

if echo "$OUTPUT" | grep -q "MUTED"; then
    MUTED=1
else
    MUTED=0
fi

SOUND_LEVEL=$(echo "$OUTPUT" | awk '{print int($2 * 100)}')

if [ "$MUTED" -eq 1 ]; then
    ICON="$VOLUME_MUTE"
else
    if [ "$SOUND_LEVEL" -lt 34 ]; then
        ICON="$VOLUME_LOW"
    elif [ "$SOUND_LEVEL" -lt 67 ]; then
        ICON="$VOLUME_MID"
    else
        ICON="$VOLUME_HIGH"
    fi
fi

echo "$ICON" "$SOUND_LEVEL" | awk '{ printf(" %s:%3s%% \n", $1, $2) }'
