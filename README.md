openstack-health-docker
=======================
Docker configurations for the OpenStack Health.

Building
--------
1. Clone this repository
2. Run: `./build.sh [name]`, where `[name]` is the name to give to the built
   image.

The build script will clone OpenStack Health automatically. On the first run,
`npm install` with automatically be run.

If you want to try a specific revision or Gerrit patch, you can manually check
out whatever you like into the `openstack-health` directory. The build script
will use it if it already exists.

Running
-------
Run with:

    docker run --name openstack-health -it \
        -p 8080:80 \
        [name]

... where `[name]` is the name you gave the build script. Assuming all goes
well, OpenStack Health should be running at http://localhost:8080/.
