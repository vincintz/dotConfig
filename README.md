# My personal dotConfig files

## Bootstrap/install

### Prerequisite
1. System is updated
    ```
    sudo apt update && sudo apt upgrade -y
    ```
2. Git is updated with the correct credentials
    ```
    sudo apt install git
    git config --global user.name "Theo Reyes"
    git config --global user.email "vincintz@yahoo.com"
    ```

### Bootstrap the config
1. Clone repo
    ```
    git -C $HOME clone git@github.com:vincintz/dotConfig.git
    ```
2. Run bootstrap command
    ```
    $HOME/dotConfig/bootstrap/ubuntu.sh
    ```

## Note
* Tested on Ubuntu 24.04 and Windows WSL -d Ubuntu-24.04
