# appdaemon
Homeassitant add-on for appdaemon

## appdaemon config

go to /addon_configs/appdaemon_custom/appdaemon/appdaemon.yaml

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
