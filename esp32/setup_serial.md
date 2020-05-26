# Setup Serial device to prevent `permission denied` error

## Add group

```sh
ls -l /dev/ttyS*

id -Gn $USER

# Add $USER to the "dialout" group
sudo usermod -a -G dialout $USER

id -Gn $USER
```

logout

login again

Note: `It will not work until you logout and login again!`

## Resources

[Fix serial port permission denied errors on Linux](https://websistent.com/fix-serial-port-permission-denied-errors-linux/)
