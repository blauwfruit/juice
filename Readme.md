# Juice: A CLI tool for upgrading PrestaShop

This tool provides a CLI interface for managing the entire upgrade process. With `juice/setup` you will be guided through the setup to make sure your upgrade runs smoothly.

We also make sure that you have a backup before upgrading with `juice/backup`. And we check the system requirements with `juice/check`.

## System requirements

You need to have the following installed:

- `curl`
- `rsync`
- `git` just to copy this repo, you can also download it via your browser

Read below how to install these.

## Recommended Database Maintenance Before Upgrade
Before running an upgrade, truncating large tables prevents the creation of bloated backups, which can significantly reduce downtime during restoration. Consider truncating the ps_connections, ps_connections_source, ps_guest, and ps_log tables to enhance performance. Here’s how to perform this maintenance:

```bash
juice/purge
```

Adjust `purge` if you wish to include additional tables.
## Getting started

Before you start, make sure you `cd` somewhere outside your application. This tool runs standalone.

```
mkdir juice && cd $_
git clone https://github.com/blauwfruit/juice.git .
find . juice -exec chmod 777 {} \;
```

Juice is now installed. You are ready to run the setup:

```
juice/setup
```

Once you finished this, you can run a backup:

```
juice/backup
```

Now we are ready to **upgrade**!

```
juice/upgrade
```

### Install hooks

To run custom scripts before and after the installation, run:

```bash
juice/install-hooks
```

This will place these files:

1. `blauwfruit-juice-upgrade-{$PRESTASHOP_NEW_VERSION}-hook-before` any in this file will run just before the upgrading process starts.
2. `blauwfruit-juice-upgrade-{$PRESTASHOP_NEW_VERSION}-hook-after` any in this file will run right after the application is successfully upgraded.

Hopefully you upgrade successfully!

## Brief summary of what happens

### < 8.x

1. The code base will be replaced by the newer version 
2. The upgrade script of PrestaShop is called `upgrade.php`
3. Store the upgrade results inside `/results` so you can analyse what needs improvement

### >= 8.x

1. The autoupgrade module will be downloaded and installed
2. The upgrade settings are loaded
3. The upgrade cli will be called

### Restore

If not, we can restore your old PrestaShop version:

```
juice/restore
```

# Support

Would you like help upgrading your PrestaShop, you can contact **blauwfruit** via support@blauwfruit.nl.

# System requirements setup

```
apt-get update && apt-get install -y git && apt-get install -y rsync
```

# Test using Docker

We've included a Docker compose file for testing the upgrade feature. With this file we can install a new PrestaShop and test the upgrade.



1. **Install a new PrestaShop the preferred version**

```
export PS_VERSION=1.7.7.5 && docker compose up
```

Once that is up and running;

2. **Enter the container**

```
docker compose exec apache /bin/bash
```

3. **Install system requirements**

```
apt-get update && apt-get install -y git && apt-get install -y rsync
```

4. **Go inside the juice folder**

```
cd ../juice
```

# Contribute

Found a bug or need an improvement, create a new issue. If you know how to fix it, please make a PR.

We recommend using Docker with the Docker Compose manifest from this repo.

## Troubleshooting 

### Dev mode

By default debugging mode is turned of/not set, see the manifest:

`# PS_DEV_MODE: true`

You might want to set this at some point during development, but turning this to true might fail the upgrade while the upgrade itself is just fine.

### ps_mbo the PrestaShop marketplace module

The module ps_mbo should be callable by external servers, that is not the case in the Docker environment. Keep that in mind.