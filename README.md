# Pupmos/ansible-cosmos-restake

An Ansible playbook for restake.app on Cosmos.

## Prerequisites

- [Python3](https://realpython.com/installing-python)
- [Ansible](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html)

_Ideally ansible should be installed via [pip](https://pip.pypa.io/en/stable/), the package installer for python._

## Assumptions

This README assumes that you've already installed `debian` or `ubuntu` onto the target environment/s.

## Setup

1. Install the required git submodule dependencies:

```console
git submodule update --init
```

2. Install the ansible `community.general` collection:

```console
ansible-galaxy collection install community.general
```

3. Rename the `hosts.example` file in `inventory/` to `hosts`:

```console
cp inventory/hosts.example inventory/hosts
```

4. Edit the `inventory/hosts` and add the IP addresses of your restake node/s.

5. Rename the `networks.local.json.example` file in `roles/restake/files/` to `networks.local.json`:

```console
cp roles/restake/files/networks.local.json.example roles/restake/files/networks.local.json
```

6. Edit the file `roles/restake/files/networks.local.json` and update with the networks you will offer restake on. For more information, see [here](https://github.com/eco-stake/restake).

## Restake

### Setup

To setup a new restake node:

```console
PASSWORD='<password>' \
DD_API_KEY=<dd_api_key> \
MNEMONIC=<mnemonic> \
PROVIDER=<provider> \
TARGET=<target> \
make setup
```

where:

| Param          | Description                                                                                            | Required |
|----------------|--------------------------------------------------------------------------------------------------------|----------|
| `<password>`   | The password for the default user that gets created.                                                   | `true`   |
| `<dd_api_key>` | The DataDog API key.                                                                                   | `false`  |
| `<mnemonic>`   | The mnemonic phrase of the restake funding wallet.                                                     | `true`   |
| `<provider>`   | The provider being used (`mevspace` or `ovhcloud`).                                                    | `false`  |
| `<target>`     | The IP address of the host to run the playbook against (all hosts will be configured if not provided). | `false`  |

e.g.:

```console
DD_API_KEY=0gD04PXCnLk0CYNHdamJ7lylKs5uMZkJ \
MNEMONIC='some words that make up my mnemonic' \
PROVIDER=ovhcloud \
TARGET=1.2.3.4 \
make setup
```

### Update

Whenever you want to update the networks you offer restake on, simply update the file `roles/restake/files/networks.local.json` accordingly and run:

```console
TARGET=<target> \
make update
```

where:

| Param      | Description                                                                                            | Required |
|------------|--------------------------------------------------------------------------------------------------------|----------|
| `<target>` | The IP address of the host to run the playbook against (all hosts will be configured if not provided). | `false`  |

e.g.:

```console
TARGET=1.2.3.4 \
make update
```
