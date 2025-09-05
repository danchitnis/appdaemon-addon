# appdaemon
Homeassitant add-on for appdaemon

## installation

1. Go to your Home Assistant instance.
2. Click on "Settings" in the left sidebar.
3. Click on "Add-ons" in the submenu.
4. Click on the "..." (three dots) menu in the top right corner.
5. Select "Repositories" from the dropdown menu.
6. In the "Add repository" field, enter the following URL: `https://github.com/yourusername/appdaemon-custom`
7. Click "Add" to add the repository.
8. After adding the repository, you should see the "AppDaemon Custom" add-on in the list of available add-ons.
9. Click on the "AppDaemon Custom" add-on to open its details page.
10. Click the "Install" button to install the add-on.
11. Once the installation is complete, click on the "Start" button to start the add-on. (notice the installation can take a while because it needs to build the image)


## appdaemon config

1. After installation go to /addon_configs/
2. you should see a folder like `1234_appdaemon-custom` (1234 is a random number)
3. Open the folder and create a file named `appdaemon.yaml`
4. Add the following configuration to the `appdaemon.yaml` file:

```yaml
appdaemon:
  time_zone: CET
  latitude: 51.725
  longitude: 14.3434
  elevation: 0
  plugins:
    HASS:
      type: hass
      ha_url: http://homeassistant.local:8123
      token: {your_homeassistant_token}


example_app:
  module: example_app
  class: ExampleApp

hadashboard:
  dash_url: http://192.168.178.82:5050

http:
    url: http://192.168.178.82:5050

```

## getting access token

1. Go to your Home Assistant instance.
2. Click on your user profile in the bottom left corner.
3. Go to the security section.
4. Scroll down to the "Long-Lived Access Tokens" section.
5. Create a new token and copy it.
6. Replace `{your_homeassistant_token}` in the configuration with the token you just created.

## testing locally

if testing locally then put the repository in `/root/addons/local/appdaemon-custom`
