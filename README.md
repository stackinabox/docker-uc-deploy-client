Docker image with ucd client.

##

## Usage

Run UCD client command
```bash
docker run --rm stackinabox/urbancode-deploy-client:latest --help
```

Run UCD client against differnet UCD server
```bash
docker run --rm stackinabox/urbancode-deploy-client:latest [--weburl http(s)://my-ucd-host(:PORT)] [--username myUser] [--password myPassword] [command] [-h] [-CMD_OPTIONS]
```  
  
Trigger UCD to create a new component version.
```bash
docker run --rm stackinabox/urbancode-deploy-client:latest [--weburl http(s)://my-ucd-host(:PORT)] [--username myUser] [--password myPassword] createVersion -component [MY_COMPONENT] -name [NEW_COMPONENT_VERSION]
``` 

Trigger UCD component to addVersionFiles

If you wish to upload files to the version simply mount a volume to the container and reference that volume in the command args. Any files within this directory will be uploaded automatically.

```bash
docker run --rm stackinabox/urbancode-deploy-client:latest -v $(pwd)/version-files:/version-files [--weburl http(s)://my-ucd-host(:PORT)] [--username myUser] [--password myPassword] addVersionFiles -component [MY_COMPONENT] -version [MY_COMPONENT_VERSION] -base /version-files
```
