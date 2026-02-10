# Define match fields
$matches = @("Order nummer:", "Order:", "Pris:")

# Define product array (optional)
$products = @("Produkter:", "Bröd", "Limpa", "Bulle")

# Call function
$results = Get-Configurations `
    -filePath "C:\Users\milou.kallman\Documents\powershell\KundLista\Ordrar.txt" `
    -matchFields $matches `
    -produktArray $products


$results | Format-Table -AutoSize






function Get-Configurations {

    [CmdletBinding()]
    param(
        [Parameter(Mandatory)]
        [string]$filePath,

        [Parameter(Mandatory)]
        [string[]]$matchFields,      # dynamic match fields (like Order nummer, Order, Pris)

        [string[]]$produktArray       # optional array of products
    )

    # Use ordered hashtable for predictable property order
    $results = [System.Collections.Generic.List[object]]::new()
    $current = $null

    Get-Content -Path $filePath | ForEach-Object {
        foreach ($field in $matchFields) {

            if ($_ -match "^$field\s*(.+)") {

                # If first field matched, start a new object
                if ($field -eq $matchFields[0]) {
                    $current = [ordered]@{ Row = $results.Count + 1 }
                    foreach ($f in $matchFields) { $current[$f] = $null }

                    # Add optional products
                    if ($produktArray) {
                        foreach ($p in $produktArray) { $current[$p] = $null }
                    }

                    $results.Add([PSCustomObject]$current)
                }

                # Set matched value
                if ($current) { $current[$field] = $Matches[1].Trim() }
            }
        }
    }

    return $results
}
