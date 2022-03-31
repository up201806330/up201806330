tp_id=`xinput list | grep -i touchpad | awk '{ print $6 }' | sed 's/id=//'`
tp_enabled=`xinput list-props $tp_id | grep Device\ Enabled | awk '{ print $4 }'`

if [ $tp_enabled = 0 ]
then
  # The touchpad is currently disabled, so turn it on.
  xinput set-prop $tp_id "Device Enabled" 1
  echo "Touchpad now on."
elif [ $tp_enabled = 1 ]
then
  # The touchpad is currently enabled, so turn it off.
  xinput set-prop $tp_id "Device Enabled" 0
  echo "Touchpad now off."
else
  echo "tp_toggle: Could not get touchpad status from xinput."
  exit 1
fi
