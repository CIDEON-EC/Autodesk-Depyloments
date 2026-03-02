# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2026-03-02
### Added
- Full WhatIf/Dry-Run mode support for all functions
- SupportsShouldProcess attribute to all relevant functions
- WhatIf/-Confirm parameter documentation

### Changed
- Improved Write-InstallLog to display only log message in WhatIf mode (without timestamp)
- All path checks in Get-WIM, Mount-WIM, Set-AutodeskDeployment, Install-Update, Install-CideonTool, Copy-Local, Disable-VaultExtension, and Uninstall-AutodeskDeployment now skip in WhatIf mode to avoid errors on non-existent paths
- Dismount-WIM optimized to work in WhatIf mode without requiring elevated privileges
- ShouldProcess calls now show more meaningful output in WhatIf mode
- Simplified INSTALL.bat sample script with dynamic path resolution - now automatically finds Install-ADSK.ps1 from parent directory

### Fixed
- Fixed WhatIf mode errors caused by attempting to access non-existent mount paths
- Fixed elevated privileges requirement errors in Dismount-WIM during WhatIf mode
- Resolved file system errors when running with -WhatIf parameter

## [1.0.1] - 2025-09-09
### Changed
- Removed old powershell scripts

## [1.0.0] - 2025-08-01

### Added
- Initial release of Autodesk Deployment Tools
- Install-ADSK.ps1 - Main installation script with WIM file automation
- Copy-Local.ps1 - Script for copying local configuration files
- Uninstall.ps1 - Uninstallation script
- Sample batch files for common scenarios
- Comprehensive README with documentation
- Support for Autodesk product installation/uninstallation
- Support for Cideon Tools installation
- WIM file mounting and management
- Logging functionality
- Registry configuration
- Environment variable setup

### Features
- Automated WIM file downloading and mounting
- Support for multiple installation modes (Install, Update, Uninstall)
- Cideon Vault Toolbox integration
- Language pack management
- Update installation
- Local file copying with user profile handling
- Comprehensive error handling and logging
- Registry path correction for repair scenarios

### Functions Available
- 22 PowerShell functions for various deployment tasks
- WIM management (Mount, Dismount, Get)
- Software installation/uninstallation
- Registry operations
- User and system configuration
- File operations and copying

[1.0.0]: https://github.com/slydlake/Autodesk-Deployment/releases/tag/v1.0.0
