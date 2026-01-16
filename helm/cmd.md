# Day-to-Day Helm Commands (VERY IMPORTANT)

    # Check Helm version

        helm version

    # Create a new chart
        helm create myapp

    # Install a chart
        helm install my-release myapp

    # List installed releases
        helm list

    # Upgrade a release
        helm upgrade my-release myapp

    # Rollback a release
        helm rollback my-release 1

    # Uninstall a release
        helm uninstall my-release

    #Dry run (VERY IMPORTANT)
        helm install my-release myapp --dry-run --debug
