# YNS Package Repository

This repository hosts packages for the [YNS Package Manager](https://github.com/spitkov/ynspkg). The repository structure is automatically maintained using GitHub Actions.

## Package Manager

To use these packages, you'll need to install the [YNS Package Manager](https://github.com/spitkov/ynspkg) first. The package manager will automatically fetch and manage packages from this repository.

## Repository Structure

```
.
├── repo.json              # Main package index
├── packages/             # Directory containing all packages
│   └── package_name/     # Individual package directory
│       ├── VERSION       # Package version file
│       ├── install.sh    # Installation script
│       ├── update.sh     # Update script
│       └── remove.sh     # Removal script

```

## Adding a New Package

1. Create a new directory under `packages/` with your package name
2. Add the required files:
   - `VERSION`: Contains the version number (e.g., "1.0", "2.1")
   - `install.sh`: Installation script
   - `update.sh`: Update script
   - `remove.sh`: Removal script
3. Push your changes to the main branch

The GitHub Actions workflow will automatically update the `repo.json` file with your package information.

## Package Scripts

Each package must contain three executable scripts:

- `install.sh`: Handles package installation
- `update.sh`: Handles package updates
- `remove.sh`: Handles package removal

All scripts should:
- Be executable
- Return 0 on success
- Return non-zero on failure
- Handle errors appropriately 