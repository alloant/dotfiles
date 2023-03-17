#!/bin/sh

doas wg-quick up clKamet

doas mount -t cifs //10.0.1.1/clsr Personal/Transfer/.clDocs/ -o uid=antonio,gid=users,credentials=/home/antonio/.wg/creden_kamet
