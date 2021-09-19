#!/system/bin/sh

status=$(getprop debug.sf.disable_hwcomposer)

if [ "$status" == "true" ] ; then
  (while :
  do
      sf=$(service list | grep -c "SurfaceFlinger")

      if [ $sf -eq 1 ]
      then
          service call SurfaceFlinger 1008 i32 1
          break
      else
          sleep 2
      fi
  done
  ) &
fi