function Invoke-RODCPasswordDiscovery {
    param(
        [object[]]$DomainController
    )
    ## Find each RO DC in the current domain
    $rodcs = $DomainController| Where-Object { $_.IsReadOnly}

    ## Grab all of the accounts that have passwords stored on RODCs
    $RevealedRodcAccounts = $Rodcs | Get-ADDomainControllerPasswordReplicationPolicyUsage -RevealedAccount

    ## No RODCs on the domain so no accounts found this time
    $RevealedRodcAccounts
}

