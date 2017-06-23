# Container for unifi controller to run on a synology nas

## Using instructions from
https://help.ubnt.com/hc/en-us/articles/220066768-UniFi-How-to-Install-Update-via-APT-on-Debian-or-Ubuntu

## Exposed ports:
https://help.ubnt.com/hc/en-us/articles/218506997-UniFi-Ports-Used

## Volumes
- data directory: `/usr/lib/unifi/data`
- log directory: `/usr/lib/unifi/logs`

## Sample directory structure on host
```
-- unifi controller
    |-- logs
    |-- data
```

## Optimizations

###### Reduce mongoDB journal size
Check, if in folder `unifi controller/data/db/journal` filesize is 1 gb.

1. Stop container
2. Add `unifi.db.extraargs=--smallfiles` to system.properties
3. Delete files in folder `unifi controller/data/db/journal`
4. Start container

Check filesize again. Should be 128 mb each.

## Todos
- [ ] Optimize Dockerfile with labels for version etc.
- [ ] Add instruction to run container
- [ ] What else?
