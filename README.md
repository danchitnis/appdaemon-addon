# appdaemon
Homeassitant add-on for appdaemon

## installation

1. Go to your Home Assistant instance. [Also](https://www.home-assistant.io/common-tasks/os/#installing-a-third-party-add-on-repository)
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

## getting access token (skip if you already have one)

1. Go to your Home Assistant instance.
2. Click on your user profile in the bottom left corner.
3. Go to the security section.
4. Scroll down to the "Long-Lived Access Tokens" section.
5. Create a new token and copy it.
6. Replace `{your_homeassistant_token}` in the configuration with the token you just created.


## appdaemon config

1. After installation go to /addon_configs/
2. you should see a folder like `1234_appdaemon-custom` (1234 is a random number)
3. create a folder name `appdaemon`
4. Open the folder and create a file named `appdaemon.yaml`
5. Add the following configuration to the `appdaemon.yaml` file:

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

hadashboard:
  dash_url: http://192.168.178.82:5050

http:
    url: http://192.168.178.82:5050

```

## setting up apps

1. In the same folder where you created the `appdaemon.yaml` file, create a new folder named `apps`.
2. Open the `apps` folder and create a file named `apps.yaml`.
3. Add the following configuration to the `apps.yaml` file:

```yaml
my_app:
  module: my_app
  class: MyApp
```

4. Create a new file named `my_app.py` in the same `apps` folder.
5. Add the following code to the `my_app.py` file:
```python
import appdaemon.plugins.hass.hassapi as hass

class MyApp(hass.Hass):

    def initialize(self):
        self.log("Hello from MyApp!")
        self.listen_event(self.event_listener, "my_event")

    def event_listener(self, event_name, data, kwargs):
        self.log(f"Received event: {event_name} with data: {data}")
        self.call_service("notify/home", message="Hello from MyApp!")
```

## starting the add-on

1. Go back to the Home Assistant add-on page.
2. Click on the "AppDaemon Custom" add-on.
3. Click the "Start" button to start the add-on.
4. Check the logs to ensure that the add-on is running correctly.


## testing locally

if testing locally then put the repository in `/root/addons/local/appdaemon-custom`
