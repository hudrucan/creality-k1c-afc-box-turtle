#!/usr/bin/env bash
# Armored Turtle Automated Filament Changer
#
# Copyright (C) 2024 Armored Turtle
#
# This file may be distributed under the terms of the GNU GPLv3 license.

# Paths
KLIPPER_PATH="/usr/data/klipper"
MOONRAKER_PATH="/usr/data/printer_data/config"
AFC_PATH="/usr/data/box_turtle"
PRINTER_CONFIG_PATH="/usr/data/printer_data/config"
AFC_CONFIG_PATH="${PRINTER_CONFIG_PATH}/box_turtle"

# Interface specific paths
MAINSAIL_SRC="$AFC_PATH/software/mainsail-afc.zip"
FLUIDD_SRC="$AFC_PATH/software/mainsail-afc.zip"
MAINSAIL_DST="$HOME/mainsail"
FLUIDD_DST="$HOME/fluidd"

# Variables
KLIPPER_SERVICE=klipper
GITREPO="https://github.com/hudrucan/creality-k1c-afc-box-turtle.git"
PRIOR_INSTALLATION=False
UPDATE_CONFIG=False
AUTO_UPDATE_CONFIG=False
UNINSTALL=False
BRANCH=main

# This FORCE_UPDATE variable is used to force an update of the AFC configuration files. This would typically be used
# when there are major changes to the AFC configuration files that require more changes than we can handle automatically.
# Anything before 1.0.0 or if it isn't defined will cause the FORCE_UPDATE to be TRUE
CURRENT_INSTALL_VERSION="1.0.0"
MIN_VERSION="1.0.0"
FORCE_UPDATE=True
BACKUP_DATE=$(date +%Y%m%d%H%M%S)


# Moonraker Config
MOONRAKER_UPDATE_CONFIG="""
[update_manager afc-software]
type: git_repo
path: /usr/data/box_turtle
origin: $GITREPO
managed_services: klipper moonraker
primary_branch: $BRANCH
install_script: install-afc.sh
"""
