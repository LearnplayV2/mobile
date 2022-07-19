# Learn Play

how to run

make sure the server is running and get the port

- connect the device and run this command on cmd:
`adb devices`

and then copy YOUR_DEVICE_ID and paste in code below and run:

```
adb -s YOUR_DEVICE_ID reverse tcp:3000 tcp:3000     // LOCALHOST CONNECTION
adb -s YOUR_DEVICE_ID reverse tcp:3001 tcp:3001     // SOCKET CONNECTION
```

Now, you can run your application on VSCODE 'Run & Debug' tab or just running this command inside the app folder:
```
flutter run -d YOUR_DEVICE_ID
```