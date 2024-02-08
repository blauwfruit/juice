# Juice: A CLI tool for upgrading PrestaShop

This tool provides a CLI interface for managing the entire upgrade process. With `juice/setup` you will be guided through the setup to make sure your upgrade runs smoothly.

We also make sure that you have a backup before upgrading with `juice/backup`. And we check the system requirements with `juice/check`.

## System requirements

You need to have the following installed:

- `curl`
- `rsync`
- `git` just to copy this repo, you can also download it via your browser

Read below how to install these.

## Getting started

Before you start, make sure you `cd` somewhere outside of your application. This tool runs standalone.

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

Hopefully you upgrade succesfully!

## Brief summary of what happens

1. The code base will be replaced by the newer version 
2. The upgrade script of PrestaShop is called `upgrade.php`
3. Store the upgrade results inside `/results` so you can analyse what needs improvement

### Restore

If not, we can restore your old PrestaShop version:

```
juice/restore
```

# Contribute

Found a bug or need an improvement, create a new issue. If you know how to fix it, please make a PR.

# Support

Would you like help upgrading your PrestaShop, you can contact **blauwfruit** via support@blauwfruit.nl.

# System requirements setup

```
apt-get update && apt-get install -y git && apt-get install -y rsync
```

# Testing using Docker

We've included a Docker compose file for testing the upgrade feature. With this file we can install a new PrestaShop 