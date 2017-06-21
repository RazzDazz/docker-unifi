Controller for unifi controller to run on a synology nas</br>
</br>
Using instructions from</br>
https://help.ubnt.com/hc/en-us/articles/220066768-UniFi-How-to-Install-Update-via-APT-on-Debian-or-Ubuntu</br>
</br>
Exposed ports:</br>
https://help.ubnt.com/hc/en-us/articles/218506997-UniFi-Ports-Used</br>
</br>
Volumes</br>
/usr/lib/unifi/data</br>
/usr/lib/unifi/logs</br>
</br>
Sample directory structure on host</br>
-- unifi controller</br>
----|-- logs</br>
----|-- data</br>

Optimizations

Reduce mongoDB journal size
- add 'unifi.db.extraargs=--smallfiles' to system.properties
- delete files in folder 'unifi controller/data/db/journal'
